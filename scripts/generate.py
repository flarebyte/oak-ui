import os
import sys

if not (sys.version_info.major == 3 and sys.version_info.minor >= 8):
    print("The photography script requires Python 3.8 or higher!")
    print("You are using Python {}.{}.".format(sys.version_info.major, sys.version_info.minor))
    sys.exit(1)