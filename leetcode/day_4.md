## Move Zeroes

Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.

__Example:__
```
Input: [0,1,0,3,12]
Output: [1,3,12,0,0]
```
Note:

* You must do this in-place without making a copy of the array.
* Minimize the total number of operations.

---

## Solution
```python
class Solution:
    def moveZeroes(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
                
        p1 = 0
        p2 = len(nums)
        while(p1 < p2):
            if nums[p1] == 0:
                del nums[p1]
                nums.append(0)
                p2 -= 1
            else:
                p1 += 1
```
