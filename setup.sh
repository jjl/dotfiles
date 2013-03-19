#!/bin/sh

# This script is a modification of one i found on the internet
# original: http://www.splitbrain.org/blog/2011-02/16-managing_dotfiles_with_dropbox

cd `dirname $0`
F=`pwd |sed -e "s#$HOME/\?##"`
 
for P in * ; do

  # Skip stuff
  case "$P" in
    # - this script
    setup.sh)
      continue;;
    # - scratch files
    *\~|\#*\#)
      continue;;
  esac
   
  # Ensure permissions. Should be safe through git anyway
  chmod -R o-rwx,g-rwx $P

  # We assume links go to the correct place
  if [ -h "$HOME/.$P" ]; then
    echo "Skipping $HOME/.$P, link found";
    continue;
  fi
 
  # If it exists, it isn't a symlink
  if [ -e "$HOME/.$P" ]; then
    if [ -e "$HOME/__$P" ]; then
      echo "Not overriding $HOME/.$P, backup file $HOME/__$P exists";
      continue;
    fi
 
    printf "Backing up: "
    mv -v "$HOME/.$P" "$HOME/__$P"
  fi
 
  # create link
  printf "Linking: "
  ln -v -s "$F/$P" "$HOME/.$P"
done
