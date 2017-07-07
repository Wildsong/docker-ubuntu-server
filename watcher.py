#!/usr/bin/env python
#  This code is based on the sample at https://pypi.python.org/pypi/inotify
#
from __future__ import print_function, unicode_literals
import logging
import inotify.adapters
import sys

def usage():
    print("""python watcher.py watchpath
watchpath is a folder to watch
Writes log messages to stdout
Note: this script watches directories recursively so watching a big file tree will be expensive!
""")
    return

def configure_logging():
    logging.basicConfig(level=logging.DEBUG)
    
def main(path):
    try:
        i = inotify.adapters.InotifyTree(path)
    except Exception as e:
        print("Make sure you have read permission on \"%s\", including subdirectories!" % path)
        print("Error:", e)
        return 1

    try:
        for event in i.event_gen():
            if event is not None:
                (header, type_names, watch_path, filename) = event
                logging.info("NAMES=%s PATH=[%s] FILENAME=[%s]",
                         type_names, watch_path.decode('utf-8'),
                         filename.decode('utf-8'))
    except KeyboardInterrupt:
        pass
    
    return 0

if __name__ == '__main__':
    try:
        path = sys.argv[1]
    except:
        usage()
        exit(1)

    configure_logging()
    rval = main(path.encode('UTF-8'))

    exit(rval)
