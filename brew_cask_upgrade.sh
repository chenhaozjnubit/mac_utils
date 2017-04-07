for name in `brew cask list`
do
	echo $name
	s1=`brew cask info $name|grep $name":"`
	s2=`brew cask info $name|grep "/usr/local/Caskroom/"$name`
	s_remote=${s1#*:}
	echo "remote:\t"$s_remote
	s_local=${s2##*/}
	s_local=${s_local%(*}
	echo "local:\t"${s_local}
	if [ $s_remote = $s_local ]; then
		echo "need not reinstall"
	else
		echo "need reinstall "$name "!"
		brew cask reinstall $name
	fi
done
brew cask cleanup