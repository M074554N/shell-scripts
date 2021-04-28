#!/usr/bin/env bash

echo "Hello $USER, I will help you install fish shell on your system.";

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "It looks like you're using Linux.";
        echo "Installing using APT...";

        # Check if Homebrew is installed
        if ! apt -v apt &> /dev/null
        	sudo apt-add-repository ppa:fish-shell/release-3
        	sudo apt-get update
        	sudo apt-get install fish
        then
        	echo "apt isn't installed!";
        fi

        # Check if fish is added to the /etc/shells file
        if grep -Fxq "/usr/local/bin/fish" /etc/shells
        then
        	echo "Fish exists in the shells file"
        else
        	echo "Adding fish shell to the /etc/shells file."
        	echo -e "\n/usr/local/bin/fish" | sudo tee -a /etc/shells
        fi

       	# Set default shell to fish
		chsh -s /usr/local/bin/fish	

		# Check to install oh-my-fish
		echo "Do you want to install oh-my-fish too?"
		read answer

		if [ $answer == 'y' -o $answer == 'yes' -o $answer == 'Y' ]
		then
			echo "Installing oh-my-fish";
			curl -L https://get.oh-my.fish | fish
			omf install bobthefish
			omf theme bobthefish
		fi

		# Run fish in the current session
		fish
elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "It looks like you're using MacOS.";
        echo "Installing using Homebrew...";

        # Check if Homebrew is installed
        if ! brew -v brew &> /dev/null
        	brew install fish
        then
        	echo "Homebrew isn't installed!";
        fi

        # Check if fish is added to the /etc/shells file
        if grep -Fxq "/usr/local/bin/fish" /etc/shells
        then
        	echo "Fish exists in the shells file"
        else
        	echo "Adding fish shell to the /etc/shells file."
        	echo -e "\n/usr/local/bin/fish" | sudo tee -a /etc/shells
        fi

       	# Set default shell to fish
		chsh -s /usr/local/bin/fish	

		# Check to install oh-my-fish
		echo "Do you want to install oh-my-fish too?"
		read answer

		if [ $answer == 'y' -o $answer == 'yes' -o $answer == 'Y' ]
		then
			echo "Installing oh-my-fish";
			curl -L https://get.oh-my.fish | fish
			omf install bobthefish
			omf theme bobthefish
		fi

		# Run fish in the current session
		fish

elif [[ "$OSTYPE" == "cygwin" ]]; then
        echo "POSIX compatibility layer and Linux environment emulation for Windows";
elif [[ "$OSTYPE" == "msys" ]]; then
        echo "Lightweight shell and GNU utilities compiled for Windows (part of MinGW)";
elif [[ "$OSTYPE" == "win32" ]]; then
        echo "I'm not sure this can happen.";
elif [[ "$OSTYPE" == "freebsd"* ]]; then
        echo "FreeBSD";
else
        echo "Unknown";
fi
