#Update-Help

# *NIX Commands

# which
Set-Alias -Name which -Value get-command


# ls aliases
Set-Alias -Name ll -Value Get-ChildItemcolor -Option AllScope
Set-Alias -Name ls -Value Get-ChildItemColorFormatWide -Option AllScope


# touch
Function MyTouch
{
    $file = $args[0]
    if($file -eq $null) {
        throw "No filename supplied"
    }

    if(Test-Path $file)
    {
        (Get-ChildItem $file).LastWriteTime = Get-Date
    }
    else
    {
        echo $null > $file
    }
}

Set-Alias -Name touch -Value MyTouch -Option AllScope


# cd aliases
Import-Module Get-ChildItemColor
$global:prev = (pwd).path

function MyCd {
  param([string]$dest_path)

  $global:prev = (pwd).path

  if($dest_path -eq "") {
      Set-Location $HOME
  } else {
    Set-Location $dest_path
  }
}

function MyBd {
	$tmp = (pwd).path
	Set-Location $global:prev
	$global:prev = $tmp
}

Set-Alias -Name cd -Value MyCd -Option AllScope
Set-Alias -Name "bd" -Value MyBd -Option AllScope
Set-Alias -Name "cd-" -Value MyBd -Option AllScope


# unzip
#
# Usage:
#   Specifying a destination directory name:
#     unzip C:\zipfile_name.zip C:\new_extracted_directory_name ==> C:\new_extracted_directory_name

#   Without specifying a destination directory name:
#     unzip C:\zipfile_name.zip ==> C:\zipfile_name
function MyUnzip {
  param(
    [string]$zipfile,
    [string]$outpath = ($zipfile).Substring(0, ($zipfile.length - 4))
  )

  # Create a stopwatch variable to track execution time
  $sw = [Diagnostics.Stopwatch]::StartNew()

  $msg = "START - Extracting: " + $zipfile
  echo $msg

  Expand-Archive $zipfile -DestinationPath $outpath

  $msg = "FINISHED - Extracting: " + $zipfile
  echo $msg

  $sw.Stop()
  $msg = "Duration: " + $sw.Elapsed
  echo $msg

}

Set-Alias -Name unzip -Value MyUnzip


# zip
#
# Usage:
#   Specifying a zipfile name:
#     zip C:\directory_name C:\myzipfilename.zip ==> C:\myzipfilename.zip

#   Without specifying a zipfile name:
#     zip C:\directory_name ==> C:\directory_name.zip
function MyZip {
  param(
    [string]$inpath,
    [string]$zipfile = $inpath
  )

  # Create a stopwatch variable to track execution time
  $sw = [Diagnostics.Stopwatch]::StartNew()

  $msg = "START - Compressing: " + $inpath
  echo $msg

  if($zipfile[$zipfile.length - 1] -eq "\") {
    $zipfile = ($zipfile).Substring(0, $zipfile.length - 1)
  }

  Compress-Archive -Path $inpath -DestinationPath $zipfile

  $msg = "FINISHED - Compressing: " + $inpath
  echo $msg

  $sw.Stop()
  $msg = "Duration: " + $sw.Elapsed
  echo $msg

}

Set-Alias -Name zip -Value MyZip



# Python aliases
Set-Alias -Name python3 -Value C:\Users\nbrinton\AppData\Local\Programs\Python\Python37-32\python.exe
Set-Alias -Name python2 -Value C:\Python27\python.exe
Set-Alias -Name python-group-build B:\ARV_Tool\python-extension\python64\python64\App\python.exe

# Web browser aliases
Set-Alias -Name firefox -Value "C:\Program Files\Mozilla Firefox\firefox.exe"
Set-Alias -Name google-chrome -Value "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"

# Function that allows user to open up a webpage or file in Microsoft Edge in the same way that you
# would with Google Chrome or Mozilla Firefox where you pass in an argument to the .exe for the file
# or web page that you would like to open. However, Microsoft Edge does not currently support opening
# local files directly from the command-line, so you can only open web pages from the command-line,
# and then type out the file url e.g. "file:///filepath/to/my/file"
function MyMicrosoftEdgeCommand {
  param(
    [string]$url
  )

  $command = "start microsoft-edge:"

  if ($url -ne "") {
    $command = $command + $url
  }
  Invoke-Expression $command

}
Set-Alias -Name microsoft-edge -Value MyMicrosoftEdgeCommand -Option AllScope


# Editors
# Note: Atom already works, so I don't need to set a default for it. Simply run it by entering "atom"
Set-Alias -Name notepadpp -Value "C:\Program Files (x86)\Notepad++\notepad++.exe"
