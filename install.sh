#!/bin/bash

####################### Instructions
# Must have git installed
# Change into the dotfiles directory, make install.sh an executable and run the script!
# 1. cd ~/dotfiles
# 2. chmod +x install.sh
# 3. ./install.sh

####################### What the script does
# 1. Clean up existing symlinks in home directory and put in ~/dotfiles_old
# 2. Adds symlinks for dotfiles in ~/dotfiles from home directory to these files
# http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
#######################

dir=~/dotfiles         # dotfiles directory
olddir=~/dotfiles_old  # old dotfiles backup directory
vimbackupdir=~/dotfiles/.vim/backup
files=".vimrc .vim .zshrc .oh-my-zsh .tmux.conf"         # list of files/folders to symlink in homedir

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir       # -p creates intermediate directories if required
echo "...done"

# change to the dotfiles directory
echo "Changing into $dir directory"
cd $dir
echo "...done"

# create vim folder for swp files
mkdir -p $vimbackupdir

install_zsh () {
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then # Test if zshell is installed
  if [[ ! -d ~/.oh-my-zsh/ ]]; then       # Check if oh-my-zsh directory exists
    git clone http://github.com/robbyrussell/oh-my-zsh.git
    echo "Renaming oh-my-zsh directory to .oh-my-zsh"
    mv -v oh-my-zsh .oh-my-zsh
  else
    echo "oh-my-zsh directory already exists"
  fi

  if [[ ! $(echo $SHELL) == $(which zsh) ]]; then # Ensure default shell is zsh
    echo "Changing login shell to use zsh"
    chsh -s $(which zsh)                          # Specify login shell to be zsh
  else
    echo "Login shell is already zsh"
  fi
else
  echo "Please install zsh with brew install zsh, then re-run this script!"
  exit
fi
}

install_vundle () {
  if [[ ! -d ~/dotfiles/.vim/bundle/Vundle.vim ]]; then
    echo "Cloning Vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/dotfiles/.vim/bundle/Vundle.vim
  else
    echo "Already have Vundle."
  fi
}

install_homebrew () {
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

install_tmux () {
  brew install tmux
}

install_python () {
  brew install python
  echo "Also updating pip..."
  pip install --upgrade pip
}

install_powerline () {
  pip install powerline-status
  git clone git@github.com:powerline/fonts.git
  cd fonts
  ./install.sh
  echo "Open iterm profile and set 14 Pt. Incosolata for Powerline"
}

install_diff_so_fancy () {
  brew install diff-so-fancy
}

install_homebrew
install_zsh
install_vundle
install_tmux
install_python
install_powerline
install_diff_so_fancy

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
  # http://www.gnu.org/software/bash/manual/html_node/Bash-Conditional-Expressions.html
  if [ ! -f ~/$file ]; then # if file does not exist and files is regular
    echo "No existing $file found"
  else
    echo "Moving any existing $file from to $olddir"
    mv -v ~/$file ~/dotfiles_old/
  fi
  echo "Creating symlink to $file in home directory."
  ln -sv $dir/$file ~/$file   # -s symbolic link
done

