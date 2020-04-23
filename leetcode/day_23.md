##   Bitwise AND of Numbers Range

Given a range [m, n] where 0 <= m <= n <= 2147483647, return the bitwise AND of all numbers in this range, inclusive.

__Example 1:__
```
Input: [5,7]
Output: 4
```
__Example 2:__
```
Input: [0,1]
Output: 0
```
---

## SOLUTION

```python
class Solution:
    def rangeBitwiseAnd(self, m: int, n: int) -> int:
        count = 0
        while m < n:
            m = m >> 1
            n = n >> 1
            count += 1
        return m<<count
```
