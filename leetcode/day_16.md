## Valid Parenthesis String

Given a string containing only three types of characters: '(', ')' and '*', write a function to check whether this string is valid. We define the validity of a string by these rules:

1. Any left parenthesis `'('` must have a corresponding right parenthesis `')'`.
2. Any right parenthesis `')'` must have a corresponding left parenthesis `'('`.
3. Left parenthesis `'('` must go before the corresponding right parenthesis `')'`.
4. `'*'` could be treated as a single right parenthesis `')'` or a single left parenthesis `'('` or an empty string.
5. An empty string is also valid.

__Example 1:__
```
Input: "()"
Output: True
```
__Example 2:__
```
Input: "(*)"
Output: True
```
__Example 3:__
```
Input: "(*))"
Output: True
```
__Note:__
The string size will be in the range [1, 100].

---

```python
class Solution:
    def checkValidString(self, s: str) -> bool:
        low = high = 0
        for char in s:
            low += 1 if char == '(' else -1
            high += 1 if char != ')' else -1
            if high < 0: break
            low = max(low, 0)

        return low == 0
```
