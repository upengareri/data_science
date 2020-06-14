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



