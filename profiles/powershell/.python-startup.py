import pprint
import sys
import os

#sys.ps1 = "\033[0;34m>>> \033[0m"
#sys.ps2 = "\033[1;34m... \033[0m"

# Turn on pretty printing.
# Python 2.7 docs: https://docs.python.org/2/library/pprint.html
# Python 3.7 docs: https://docs.python.org/3/library/pprint.html
sys.displayhook = pprint.pprint

# Add clear screen function for Python interpreter.
clear = lambda: os.system('cls')
# Invoke clear() in the repl to clear the screen
