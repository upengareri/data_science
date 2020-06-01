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

### TODO: Writing your own context manager to handle resources
    __Example__: Indenter and class that measures execution time of a code block

---

### Key Takeaways on Context Manager
* The with statement simplifies exception handling by encapsulating standard uses of try/finally statements in so-called context managers.
* __Most commonly it is used to manage the safe acquisition and release of system resources. Resources are acquired by the with statement and released automatically when execution leaves the with context.__
* Using with effectively can help you avoid resource leaks and make your code easier to read.

---

### UNDERSCORES _

__Key Takeaways__
• Single Leading Underscore `“_var”`: Naming convention indicating a name is meant for internal use. Generally not enforced by the Python interpreter (except in wildcard imports) and meant as a hint to the programmer only.
• Single Trailing Underscore `“var_”`: Used by convention to avoid naming conflicts with Python keywords.
• Double Leading Underscore `“__var”`: Triggers `name mangling` when used in a class context. Enforced by the Python interpreter (to avoid name collision with subclass).
• Double Leading and Trailing Underscore “__var__”: In- dicates special methods defined by the Python language. Avoid this naming scheme for your own attributes.
• Single Underscore “_”: Sometimes used as a name for tem- porary or insignificant variables (“don’t care”). Also, it repre- sents the result of the last expression in a Python REPL session.

---

### Template String

```python
>>> templ_string = 'Hey $name, there is a $error error!' 
>>> Template(templ_string).substitute(
... name=name, error=hex(errno))
'Hey Bob, there is a 0xbadc0ffee error!'
```
> Remember to use it whenever you have to string format _user input_ to avoid security vulnerabilities.

---

### Function OBJECTS and NAMES are two separate concerns

```python
def yell(text):
    return text.upper() + "!"

>>> yell('hello')
'HELLO!'

>>> bark = yell
>>> bark('woof')
'WOOF!'
```
Function objects and their names are two separate concerns. Here’s more proof: You can delete the function’s original name (yell). Since another name (bark) still points to the `underlying function` (IMPORTANT TO NOTE), you can still call the function through it:
```python
>>> del yell
>>> yell('hello?')
NameError: "name 'yell' is not defined"
>>> bark('hey')
'HEY!'
```
---
TODO: A clear use case understanding of `higher-order functions`, `nested functions` and special nested functions that can store local state`(lexical closures)` or simply closures.

What’s a lexical closure? (child function can capture the parent function’s local state) It’s just a fancy name for a function that remembers the values from the enclosing lexical scope even when the program flow is no longer in that scope.

---

### Lambdas = single expression function
Lambda functions are restricted to a single expression. This means a lambda function can’t use statements or annotations—not even a return statement.

How do you return values from lambdas then? Executing a lambda function evaluates its expression and then automatically returns the expression’s result, so there’s always an implicit return state- ment. That’s why some people refer to lambdas as `single expression functions`.

---

### Decorators
Decorators and closures are difficult to understand.
Decorators takes a callable and returns a callable.

Decorators takes a callable(function) puts a closure that acts as a wrapper for the input callable and then changes it's behaviour within the closure and then the decorator returns the new callable closure (child function)

---

### Python returns None by default
Python adds an implicit return None statement to the end of any function. Therefore, if a function doesn’t specify a return value, it re- turns None by default.

---

### Every class needs a `__repr__`

If you don’t add a __str__ method, Python falls back on the result of __repr__ when looking for __str__. Therefore, I recommend that you always add at least a __repr__ method to your classes. This will guarantee a useful string conversion result in almost all cases, with a minimum of implementation work.

Basic Example:
```python
class Car:
    def __init__(self, color, mileage):
        self.color = color
        self.mileage = mileage

    def __repr__(self):
        return f"{self.__class__.__name__}({self.color!r}, {self.mileage!r})"
```
> !r conversion flag is to make sure the output string uses repr(self.color) and repr(self.mileage) instead of str(self.color) and str(self.mileage)

An optional `__str__` implementation
```python
def __str__(self):
return f'a {self.color} car'
```

The result of __str__ should be readable. The result of __repr__ should be unambiguous

---

> TODO: Use casees of "raising exception and handling exception"

When to raise exception and when to handle and how to handle other exceptions

---



