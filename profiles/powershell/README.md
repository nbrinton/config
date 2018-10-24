# Powershell Profile

## Create A New PowerShell Profile and Copy-Paste Additions
First follow the instructions at
[Create A PowerShell Profile](https://www.howtogeek.com/126469/how-to-create-a-powershell-profile/)
to check to see if you already have a PowerShell profile and create a new one if you don't. Then, copy-paste the contents of `powershell_profile.txt` into your newly created or pre-existing PowerShell profile file, typically called `Microsoft.PowerShell_profile.ps1`.

If you are having permission issues when trying to run the script (via running a new instance of PowerShell after copying it into the appropriate directory), then see the [Microsoft Execution Policies Documentation](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-6&viewFallbackFrom=powershell-Microsoft.PowerShell.Core). I had to set the execution policies after I reset my personal laptop. I used following commands to set the `RemoteSigned`:

Get the current policies:
`Get-ExecutionPolicy -List`

Set the policy for a particular group:
`Set-ExecutionPolicy -ExecutionPolicy <PolicyName> -Scope <scope>`

I used the following two commands:
~~~
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
~~~



## Add Color Scheme
1) Navigate to your `~\Documents\WindowsPowerShell` directory and create a new directory called `Modules`.
2) Create a directory named `Get-ChildItemColor` inside the `Modules` directory.
3) Copy the file `Get-ChildItemColor.psm1` into the `Get-ChildItemColor` directory.
4) Now `ls` does a regular listing and `ll` does a long informed one, and PowerShell now colors
different types of files with their own color based on their category of file.

5) For further information, go to [Original Repo](https://github.com/joonro/Get-ChildItemColor)
where I originally got this code before my additions.

## Add Custom Python Interpreter Configuration
In order to add custom functionality to your python interpreter REPL, add the file
`.python-startup.py` to your home directory and go into your environment variable manager and add a
user environment variable called `PYTHONSTARTUP` that points to that file. Currently this adds a
function called `clear()` that clears the REPL screen and also imports pretty print and sets a
display hook for the system to it so that things print prettily on the screen.
