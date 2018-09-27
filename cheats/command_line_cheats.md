## Command Line Cheat Sheet (Mac Terminal)


	SHORTCUTS

&emsp;&emsp;<kbd>**ctrl + c**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; Kill process (running process will be terminated)

&emsp;&emsp;<kbd>**ctrl + u**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; Delete line

&emsp;&emsp;<kbd>**ctrl + a**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; Move to beginning of line

&emsp;&emsp;<kbd>**ctrl + e**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; Move to end of line


	COMMAND HISTORY

&emsp;&emsp;<kbd>**history**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp; Show command history

&emsp;&emsp;<kbd>**UP (arrow key)**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp; See previous command

&emsp;&emsp;<kbd>**DOWN (arrow key)**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp; See next command (if any)
	
&emsp;&emsp;<kbd>**ctrl + r**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;Search recently used commands

&emsp;&emsp;<kbd>**!!**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp; Repeat last command

&emsp;&emsp;<kbd>**sudo !!**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp; Repeat last command as root

	DIRECTORIES BASIC

&emsp;&emsp;<kbd>**ls**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; View contents of current directory

&emsp;&emsp;<kbd>**ls -l**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; View contents of current directory (l:long format)

&emsp;&emsp;<kbd>**ls -a**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; View contents of current directory including hidden

&emsp;&emsp;<kbd>**ls -t**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; View contents of current directory sorted by modified date

&emsp;&emsp;<kbd>**pwd**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; Present working directory

&emsp;&emsp;<kbd>**mkdir dir**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Make directory 'dir'

&emsp;&emsp;<kbd>**rm -r dir**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Remove directory 'dir'

&emsp;&emsp;<kbd>**rm -rf dir**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp; Remove directory 'dir' (f:force)

&emsp;&emsp;<kbd>**cd**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp; Change to home directory

&emsp;&emsp;<kbd>**cd dir**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Change to sub-directory (i.e. move to child directory within the present &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;working directory)
	`cd dir/dir2` jump to deeper sub-directories directly

&emsp;&emsp;<kbd>**cd ..**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; Jump from present working working directory to parent directory (i.e directory &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;just above it)
	`cd ../..` jump to higher parent-directories directly

&emsp;&emsp;<kbd>**cd -**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp; Switch to previous working directory

&emsp;&emsp;<kbd>**cp -r dir1 dir2**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp; Copy dir1 to dir2


	FILES BASIC

&emsp;&emsp;<kbd>**touch file**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;Create file

&emsp;&emsp;<kbd>**rm file**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&emsp;&nbsp;&nbsp;&nbsp;Remove file

&emsp;&emsp;<kbd>**rm -f file**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Remove file (f:force)

&emsp;&emsp;<kbd>**cp file1 file2**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;Copy file1 to file2

&emsp;&emsp;<kbd>**mv oldname newname**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;Rename file

&emsp;&emsp;<kbd>**mv old_location new_location**</kbd>&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Move file (old_location and new_location are the paths)

&emsp;&emsp;<kbd>**more file**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp; Output contents of file 'file'

&emsp;&emsp;<kbd>**head file**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp; Output first 10 lines of file 'file'

&emsp;&emsp;<kbd>**tail file**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp; Output last 10 lines of file 'file'

&emsp;&emsp;<kbd>**ln -s file1 new_location**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Create shortcut/symbolic link of file1 to new_location 


	COMPRESSION
_Note_: ***tar*** is a file archiving technique i.e combining multiple files into a single file. It is helpful for transferring multiple files at once over internet as it is simple and fast.
	
***gzip*** is a file compression technique for large files. It is helpful for transferrring large files from source to destination as it reduces the size of the file. It can later be decompressed at the destination.


&emsp;&emsp;<kbd>**tar -cf files.tar file1 file2**</kbd>&emsp;&emsp;&emsp;&nbsp;&nbsp; Create a tar file 'files.tar' with 'file1' and 'file2'

&emsp;&emsp;<kbd>**tar -xf files.tar**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Extract files from 'files.tar'

&emsp;&emsp;<kbd>**tar -czf files.tar.gz file1 file2**</kbd>&emsp;&nbsp;&nbsp;&nbsp; Create a tar file with gzip compression

&emsp;&emsp;<kbd>**tar -xzf files.tar.gz**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Extract files from 'files.tar.gz'

&emsp;&emsp;<kbd>**gzip file**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Compress file with gzip technique

&emsp;&emsp;<kbd>**gzip -d file.gz**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp; Decompress 'file.gz'


	SYSTEM BASIC

&emsp;&emsp;<kbd>**date**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Show date and time

&emsp;&emsp;<kbd>**uptime**</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; Shows system uptime i.e time since boot

&emsp;&emsp;<kbd>**du -sh \***</kbd>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp; Display disk usage (here * means all files and directories within &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;the directory/path)



















