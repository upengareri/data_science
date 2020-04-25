## Jump Game

Given an array of non-negative integers, you are initially positioned at the first index of the array.

Each element in the array represents your __maximum__ jump length at that position.

Determine if you are able to reach the last index.

__Example 1:__
```
Input: [2,3,1,1,4]
Output: true
Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
```
__Example 2:__
```
Input: [3,2,1,0,4]
Output: false
Explanation: You will always arrive at index 3 no matter what. Its maximum
             jump length is 0, which makes it impossible to reach the last index.
```

---

## SOLUTION

```python
class Solution:
    def canJump(self, nums: List[int]) -> bool:
        max_jump = 0
        for i in range(len(nums)):
            if i > max_jump: return False
            max_jump = max(max_jump, i+nums[i])
        return True
```

---

If from any index I can jump to the last index, then True.
The last index would be `current_index + value at that index` which is the jump that index can take.
