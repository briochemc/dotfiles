# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
  shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then
	# Ensure existing Homebrew v1 completions continue to work
	export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d";
	source "$(brew --prefix)/etc/profile.d/bash_completion.sh";
elif [ -f /etc/bash_completion ]; then
  source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# git completion for greenplanet
if [ -f /etc/bash_completion.d/git ]; then
  source /etc/bash_completion.d/git
fi
# Enable tab completion for `g` by marking it as an alias for `git` for greenplanet
if type _git &> /dev/null && [ -f /etc/bash_completion.d/git ]; then
  complete -o default -o nospace -F _git g;
fi;

# Additions for UCI campus-wide HPC use of modules:
if [ ${HOSTNAME:0:4} = "hpc-" ]; then
  source /data/shell-syswide-setup/system-wide-bashrc
fi;
if [ ${HOSTNAME:0:8} = "compute-" ]; then
  source /data/shell-syswide-setup/system-wide-bashrc
fi;

# Source global definitions for greenplanet
if [ ${HOSTNAME:0:7} = "gplogin" ]; then
  if [ -f /etc/bashrc ]; then
    source /etc/bashrc
  fi;
fi;



