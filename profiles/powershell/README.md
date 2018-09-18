# Powershell Profile

## Create A New PowerShell Profile and Copy-Paste Additions
First follow the instructions at
[Create A PowerShell Profile](https://www.howtogeek.com/126469/how-to-create-a-powershell-profile/)
to check to see if you already have a PowerShell profile and create a new one if you don't. Then, copy-paste the contents of `powershell_profile.txt` into your newly created or pre-existing PowerShell profile file, typically called `Microsoft.PowerShell_profile.ps1`.

## Add Color Scheme
1) Navigate to your `~\Documents\WindowsPowerShell` directory and create a new directory called `Modules`.
2) Copy the file `Get-ChildItemColor.psm1` into the `Modules` directory.
3) Now `ls` does a regular listing and `ll` does a long informed one, and PowerShell now colors
different types of files with their own color based on their category of file.

4) For further information, go to [Original Repo](https://github.com/joonro/Get-ChildItemColor)
where I originally got this code before my additions.

## Add Custom Python Interpreter Configuration
In order to add custom functionality to your python interpreter REPL, add the file
`.python-startup.py` to your home directory and go into your environment variable manager and add a
user environment variable called `PYTHONSTARTUP` that points to that file. Currently this adds a
function called `clear()` that clears the REPL screen and also imports pretty print and sets a
display hook for the system to it so that things print prettily on the screen.
