Version 1.5 update
------------------

Visual Composer V1.5 offers three new features over earlier versions:
	1 - Bank file for instrument sounds
	2 - Support of additional wave forms
	3 - New Open, Save and Save As dialogs

     The new instrument bank file stores many intrument sounds together in
one file.  The many .INS files are now bundled together in one .BNK file.
This results in a significant saving of disk space and makes backing up much
easier.  If you have other Ad Lib products which are earlier than version
1.5, you may need to convert between the old and new formats.  To convert
between the old and new formats, we have provided a conversion program
which is explained in the file BANKMNG.TXT.  In BANKMNG.TXT you will so
find information on ordering updates.
     By default, Visual Composer V1.5 uses the default bank file STANDARD.BNK,
but you may choose another bank file if you wish (for example, if you have
created a new bank file using Instrument Maker).  To do this, a new command,
"Bank File", has been added to the File (F5) menu.  The Bank File command
works the same way as the Open command, except that you choose an instrument
bank file instead of a song file.

     The wave form is a parameter used in the specification of an Ad Lib
instrument sound.  The use of the additional wave forms means that a greater
variety of sounds can be used.  If you have version 1.5 of the Instrument
Maker, then the sounds you create which use the wave form parameter can now
be used in Visual Composer (and any other Ad Lib software which is version
1.5 or higher).

     The Open, Save and Save As commands in the File (F5) menu have been
changed to allow you to change directories while in the dialog.  The scroll
box containing the list of file names now contains directory names as well.
To change directories, use the up and down cursor keys to select the desired
directory name and press F1.  If you select the line "..", then you will
move one directory up in the hierarchy.  You may move up and down through
sub-directories as many times as you wish.  Song files are selected by
pressing return as before.  Note that the two commands in the menu for
changing directories are no longer necessary and have been removed.


Version 1.28 update
-------------------
The problem with tempos where a large number of ticks per beat is being
used has been resolved.


Version 1.22 update
-------------------

In addition to the support of the MGA (Hercules) card, the version 1.2
of Visual Composer includes enhancement on the Cut and Copy commands as 
well as the Interrupt command.  The User Guide should therefore be 
modified as follows:

Page 96
The note seen under the paragraphs Cut and Copy should read as follows:
"Interpretation data  IS  included in this operation."

Page 99
The paragraph Interrupt should read as follows:
"This command is used to interrupt the play back of a song.  At the beginning 
of the playback, a clock symbol momentarily appears in the menu bar.  For as
long as you see this clock, all commands will be inoperative EXCEPT for
the shortcut command Interrupt [CTRL I]."

This exception should also be understood when reading the second paragraph
of page 58 as well as the last paragraph of page 59.  

Page 117
The following sentence should be added to the first paragraph:
It is especially important to use a bigger memory buffer when working
with pieces containing a lot of interpretation data.  Some notes may be
left out when playing back complex pieces with a memory buffer that has 
not been enlarged accordingly. 

If your computer has more than 256K of RAM, it would be preferable, in
any case, to increase the size of the sound driver memory buffer to
12K.  To do so, change the following line in the ".BAT" file:   
       SOUND b1000 to SOUND b3000

