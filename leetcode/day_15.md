## Product of Array Except Self

Given an array `nums` of n integers where n > 1,  return an array `output` such that `output[i]` is equal to the product of all the elements of `nums` except `nums[i]`.

__Example:__
```
Input:  [1,2,3,4]
Output: [24,12,8,6]
```
__Constraint:__
It's guaranteed that the product of the elements of any prefix or suffix of the array (including the whole array) fits in a 32 bit integer.

__Note:__ Please solve it __without division__ and in O(n).

__Follow up:__
Could you solve it with constant space complexity? (The output array does not count as extra space for the purpose of space complexity analysis.)

---

## Solution
```python
class Solution:
    def productExceptSelf(self, nums: List[int]) -> List[int]:
        n = len(nums)
        left = [0]*n  # space O(n)
        right = [0]*n  # space O(n)
        output = [0]*n  # space O(n)
        
        left[0] = 1  # leftmost
        right[n - 1] = 1  # rightmost

        for i in range(1, n):  # time O(n)
            left[i] = nums[i - 1] * left[i - 1]
            
        # Since the last number is already set to 1, 
        # start from the penultimate index.
        for j in range(n-2, -1, -1):  # time O(n)
            right[j] = nums[j + 1] * right[j + 1]  
        for i in range(n):  # time O(n)
            output[i] = left[i] * right[i] 
        
        return output
```
