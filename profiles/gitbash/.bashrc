
# GitBash alias
alias gitbash="bash"

# *NIX Commands

# Custom cls command that clears the screen and then lists the contents
function MyCls {
  clear
  ls
}
alias cls=MyCls

# Python aliases
alias python3="/c/Users/nbrinton/AppData/Local/Programs/Python/Python37-32/python.exe"
alias python2="/c/Python27/python.exe"
alias python-group-build "/b/ARV_Tool/python-extension/python64/python64/App/python.exe"

# Web browser aliases
alias google-chrome="/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe"
alias firefox="/c/Program\ Files/Mozilla\ Firefox/firefox.exe"

function MyMicrosoftEdgeCommand {
  echo "Command not currently supported in GitBash"
  # command="microsoft-edge:"
  #
  # if [ "$1" != "" ]; then
  #   $command=$command$1
  # fi
  #
  # eval $command

}
alias microsoft-edge=MyMicrosoftEdgeCommand
# Editor aliases
# Note: Atom already works, so I don't need to set a default for it. Simply run it by entering "atom"
alias notepad++="/c/Program\ Files\ \(x86\)/Notepad++/notepad++.exe"

# More intuitive Visual Studio Code aliases
alias vscode=code
alias visual-studio-code=code
