## Notes on bash scripting

### To list all shell installed
```bash
cat /etc/shells
```
---

$PATH is where the shell will look for the command/tool that you provide in the terminal. For example -
```bash
echo "hello world"
```
here the shell will look for `echo` command in all the paths that $PATH contains in the list.

And to know which `echo` will the shell select from the path, you can type
```bash
which echo
```
---

`$` at the terminal tells you that you are not the root
---
### Stream (input stream and output stream)

`>` stream output from/of left to right
`<` stream input from/of right to left

Example:
```bash
missing:~$ echo hello > hello.txt
missing:~$ cat hello.txt
hello
missing:~$ cat < hello.txt
hello
missing:~$ cat < hello.txt > hello2.txt
missing:~$ cat hello2.txt
hello
```

'|' pipe (chains programs/tools such taht output of one is input to other tool)
'>>' append
'tee' tool to redirect to both file as well as to terminal 
---
### Interesting concept to understand

```bash
$ sudo find -L /sys/class/backlight -maxdepth 2 -name '*brightness*'
/sys/class/backlight/thinkpad_screen/brightness
$ cd /sys/class/backlight/thinkpad_screen
$ sudo echo 3 > brightness
An error occurred while redirecting file 'brightness'
open: Permission denied
```

This error may come as a surprise. After all, we ran the command with sudo! This is an important thing to know about the shell. Operations like |, >, and < are done by the shell, not by the individual program. 
`echo` and friends do not “know” about `|`. They just read from their input and write to their output, whatever it may be. In the case above, the shell (which is authenticated just as your user) tries to open the brightness file for writing, before setting that as sudo echo’s output, but is prevented from doing so since the shell does not run as root. Using this knowledge, we can work around this:
```bash
$ echo 3 | sudo tee brightness
```
---

### `source` command
* It can be used to (re)load any functions or variable from a file into current shell script or command prompt.

It's like an import statement in python. When we source any file in the current prompt (for example), the commands within the file will be executed and functions and variables will be accessible for execution/use.

marco.sh
```bash
marco () {
    export MARCO=$(pwd)
}

polo () {
    cd $(MARCO)
}
```

Now, when I source the above file (marco.sh) to the current command prompt, the functions marco and polo will be accessible to the prompt.

```bash
marco
```
On running this function, the MARCO variable will be exported temporarily to the current subprocess running the command prompt and thus on running the `polo` will read that `MARCO` var

> On exiting the command prompt the MARCO variable will be removed from the `env`. To keep it permanently, we need to add/export it in .bashrc, which gets sourced everytime the terminal/command prompt is launched.

---
### xargs

Commands will take input from both __arguments__ and __STDIN__ such as `grep`. When piping commands, we are connecting STDOUT to STDIN, but some commands like `tar` take inputs from __arguments__.

To bridge this disconnect there's the `xargs` command which will execute a command using `STDIN` as `arguments`.
For example `ls | xargs rm` will delete the files in the current directory.

---

### SIGNALS
_PAUSING AND BACKGROUND PROCESS_

Example of a process in terminal
```bash
sleep 100
```

* to pause it - `^Z` (__SIGSTOP__)
* to continue it (the process) in background - `bg`
* to know about all the unfinished jobs runnings with current terminal session - `jobs`
    it lists the process numbers or job numbers (not pid) of the jobs which can be used to `stop, kill, bg, fg etc.` using `%` symbol which is a way to refer to those jobs. example - `bg %1`
* to get the pid of a job - `pgrep <pattern>` [example - `pgrep sleep`]
* to bring process to foreground - `fg`
* to interrupt foreground job - `^C` (__SIGINT__)
* to quit foreground job - `^\` (__SIGQUIT__)
* to terminate foreground job - `kill -TERM <PID>` (__SIGTERM__)

