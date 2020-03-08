#!/bin/zsh
brew cleanup
echo 'start'
brew update
brew upgrade
brew cask upgrade
for name in `brew cask list`
do
	echo $name
	s1=`brew cask info $name|grep $name":"`
	s_local=`ls "/usr/local/Caskroom/"$name`
	s_remote=${s1#*:}
	echo "remote:\t"$s_remote
	echo "local:\t"${s_local}
	if [[ "$s_remote" == *"$s_local"* ]]
	then
		echo "need not reinstall"
	else
		echo "need reinstall "$name "!"
		brew cask reinstall $name 
	fi
done
rm -rf /Volumes/RamDisk/Library/Caches/Homebrew/*.*
rm -rf /Volumes/RamDisk/Library/Caches/Homebrew/downloads/*.*
rm -rf /Volumes/RamDisk/Library/Caches/Homebrew/Cask/*.*
echo 'end'
