## Single Number

Given a non-empty array of integers, every element appears twice except for one. Find that single one.

__Note:__

Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?

__Example 1:__

```
Input: [2,2,1]
Output: 1
```

__Example 2:__
```
Input: [4,1,2,1,2]
Output: 4
```
---

## SOLUTION

```python
from collections import Counter
class Solution:
    def singleNumber(self, nums: List[int]) -> int:
        res = Counter(nums)
        for k,v in res.items():
            if v == 1:
                return k
```
