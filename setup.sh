#!/bin/sh

# This script is a modification of one i found on the internet
# original: http://www.splitbrain.org/blog/2011-02/16-managing_dotfiles_with_dropbox

# Currently, I only support linux and osx
# Mostly because I don't have a solaris or BSD environment handy

case "$(uname -s)" in
  Linux|Darwin)
    ;;
  *)
    echo "Unsupported OS: $OS"
    exit 1
    ;;
esac

cd `dirname $0`
F=`pwd |sed -e "s#$HOME/\?##"`
 
for P in * ; do

  # Skip stuff
  case "$P" in
    # - this script
    setup.sh)
      continue;;
    # - repository files
    README|LICENSE)
      continue;;
    # - scratch files
    *\~|\#*\#|*.swp)
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
