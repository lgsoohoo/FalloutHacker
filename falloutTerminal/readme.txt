Fallout Terminal
   A GNU Nano aesthetic modification
   by PikaLuca87
   https://github.com/lgsoohoo/FalloutHacker
   Summer 2018

	Fallout Terminal is a modification of GNU Nano that attempts to make the text editor appear like the terminals from the video game "Fallout" by editing Nano's source code. Users may copy the program directly to their computer, or can follow the mod change log and the edits themselves. This program can run alongside the standard GNU Nano.


	How to install:
===============================
	
Clone the FalloutHacker repository to your computer (if necessary)
	> git clone https://github.com/lgsoohoo/FalloutHacker.git

Change directories to 'falloutTerminal'
	> cd FalloutHacker/falloutTerminal

Copy 'foterminal' to /usr/local/bin
	> cp foterminal /usr/local/bin

Run or open a file using Fallout Terminal
	> foterminal
	> foterminal <your file>



	How to make the modifications yourself:
=======================================================

Download GNU Nano's source code at:
	https://www.nano-editor.org/download.php

Extract contents
	> tar xvzf nano-x.y.z.tar.gz

Clone the FalloutHacker repository to your computer (if necessary), and view the 'Mod Guide' and 'Mod Change Log' as an aid to making changes
	> git clone https://github.com/lgsoohoo/FalloutHacker.git 
	> cd FalloutHacker/falloutTerminal
	> gedit modGuide.txt
	> gedit modChangeLog.txt

Make changes as necessary

Install appropriate packages

Configure, make and install the modified Nano
	> ./configure
        > make
        > sudo make install

Rename the modified Nano to 'foterminal'
	> cd /usr/local/bin
	> mv nano foterminal


Run or open a file using Fallout Terminal
	> foterminal
	> foterminal <your file>




Disclaimer: All original source code was created and provided by the GNU Nano at https://www.nano-editor.org/ . Part of these instructions were pulled from Nano's README file


