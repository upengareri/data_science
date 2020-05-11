## Backspace String Compare

Given two strings S and T, return if they are equal when both are typed into empty text editors. # means a backspace character.

Note that after backspacing an empty text, the text will continue empty.

__Example 1:__
```
Input: S = "ab#c", T = "ad#c"
Output: true
Explanation: Both S and T become "ac".
```
__Example 2:__
```
Input: S = "ab##", T = "c#d#"
Output: true
Explanation: Both S and T become "".
```
__Example 3:__
```
Input: S = "a##c", T = "#a#c"
Output: true
Explanation: Both S and T become "c".
```
__Example 4:__
```
Input: S = "a#c", T = "b"
Output: false
Explanation: S becomes "c" while T becomes "b".
```

Note:

* 1 <= S.length <= 200
* 1 <= T.length <= 200
* S and T only contain lowercase letters and '#' characters.

Follow up:

Can you solve it in O(N) time and O(1) space?

---

## SOLUTION

```python
class Solution:
    def backspaceCompare(self, S: str, T: str) -> bool:
        while(S.find("#") > -1):
            i = S.find("#")
            if i == 0:
                S = S[i+1:]
            else:
                S = S[:i-1] + S[i+1:]
        while(T.find("#") > -1):
            i = T.find("#")
            if i == 0:
                T = T[i+1:]
            else:
                T = T[:i-1] + T[i+1:]
        # ----------- NEVER DO THE COMMENTED CODE MISTAKE ----------
        # if S == T:
        #     return True
        # return False
        return S == T
    
    # ---------------------------------------
    # Learning 1: I could have avoided two while loops that are exactly the same code by putting it in inner function.
    # Learning 2: I could have thought of using an array to store the value and popping out if '#' was encountered or so. I meaning list, dictionary or str() solves many problems
    # --------------------------------------
    # Code I liked
    
# class Solution:
#     def backspaceCompare(self, S: str, T: str) -> bool:
        
#         def finalStr(s: str):
#             stack = []
#             for char in s:
#                 if stack and char == '#':
#                     stack.pop()
#                 elif char != '#':
#                     stack.append(char)
#             return stack

#         return finalStr(S) == finalStr(T)
```
