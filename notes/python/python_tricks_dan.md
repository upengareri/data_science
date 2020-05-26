### Using `assert` as debug mode while writing big programs

> don't use assert with tuple

---

### string literal concatenation - multi line

```python
my_str = ("This is a super long string constant"
          "spread out across multiple lines. "
          "And look, no backslash characters needed!")
```

---

### Smart formatting and comma placement can make your list, dict, or set constants easier to maintain.
```python
>>> names = [
... 'Alice',
... 'Bob',
... 'Dilbert',
... 'Jane',]
```
---

### Resource handling logic using `with`

```python
with open("hello.txt", "w") as f:
    f.write("hello, world!")
```

is equivalent to

```python
f = open("hello.txt", "w")
try:
    f.write("hello, world!")
finally:
    f.close()
```

```python
f = open("hello.txt", "w")
f.write("hello, world!")
f.close()
```
In the above script there is a potential bug. The file may not get close if any exception occurs while write text to it. In situations like this we should use context manager `with`

Another Example:
```python
some_lock = threading.Lock()

# Harmful
some_lock.acquire()
try:
    # Do something
finally:
    some_lock.release()

# Better
with some_lock:
    # Do something
```
And thus we don't have to worry about `some_lock.acquire()` and `some_lock.release()`.

> Instead of having to write an explicit `try...finally` statement each time, using the `with` statement takes care of that for us.

---

