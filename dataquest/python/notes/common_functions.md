### String operations

1. [str.replace()](https://docs.python.org/3/library/stdtypes.html#str.replace)

```
test_data = ["(1951)","c. 1915",
             "(1988)", "2002", "1957-1959",
             "c. 1955.", "c. 1970's", 
             "C. 1990-1999"]

bad_chars = ["(",")","c","C",".","s","'", " "]

def strip_characters(string):
    for char in bad_chars:
        string = string.replace(char, "")
    return string

stripped_test_data = []
for data in test_data:
    cleaned_string = strip_characters(data)
    stripped_test_data.append(cleaned_string)
```
> Good thing about this method is it will return old string if nothing found to be replaced

2. [str.split()](https://docs.python.org/3/library/stdtypes.html#str.split)
```
string = "data science"
split_string = string.split()
Output: ['data', 'science']
string2 = "1990-1992"
print(string2.split("-"))
Output: ["1990", "1992"]
```

3. [str.startswith()](https://docs.python.org/3/library/stdtypes.html#str.startswith)
```
string = "DataScience"
string.startswith("data")
Output: False
```
