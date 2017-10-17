#!/usr/bin/env bash

# Create a MATLAB_utilities/ directory if it does not exist
cd ~
DIRECTORY="MATLAB_utilities"
if [ ! -d "$DIRECTORY" ]; then
  mkdir $DIRECTORY
  echo "Created $DIRECTORY/ directory"
fi

# List of directories in the MATLAB utilities
declare -a DIRS=("MATLAB_colormaps"
                 "Inpaint_Nans"
                 "matrix_manipulations"
                 "BrewerMap"
                 "export_fig")
# List of corresponding github repositories
declare -a REMOTE_REPOS=("https://github.com/briochemc/MATLAB_colormaps.git"
                         "https://github.com/briochemc/Inpain_Nans.git"
                         "https://github.com/briochemc/matrix_manipulations.git"
                         "https://github.com/DrosteEffect/BrewerMap.git"
                         "https://github.com/altmany/export_fig.git")

# Then pull or clone all the repositories from github
# by looping through the above array
arraylength=${#DIRS[@]} # Number of directories
for (( i=1; i<${arraylength}+1; i++ )); do
  cd ~/$DIRECTORY
  if [ -d "${DIRS[$i-1]}" ]; then
    echo "($i) Pulling ${DIRS[$i-1]} from ${REMOTE_REPOS[$i-1]}"
    cd ${DIRS[$i-1]} && git pull && cd ..
  else
    echo "($i) Cloning ${DIRS[$i-1]} from ${REMOTE_REPOS[$i-1]}" 
    git clone ${REMOTE_REPOS[$i-1]}
  fi
done

# Remove everything (for testing purposes)
#cd ~;
#rm -rf $DIRECTORY
#git pull origin master;
#
#function doIt() {
#	rsync --exclude ".git/" \
#		--exclude ".DS_Store" \
#		--exclude ".osx" \
#		--exclude "bootstrap.sh" \
#		--exclude "README.md" \
#		--exclude "LICENSE-MIT.txt" \
#		-avh --no-perms . ~;
#	source ~/.bash_profile;
#}
#
#if [ "$1" == "--force" -o "$1" == "-f" ]; then
#	doIt;
#else
#	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
#	echo "";
#	if [[ $REPLY =~ ^[Yy]$ ]]; then
#		doIt;
#	fi;
#fi;
#unset doIt;
