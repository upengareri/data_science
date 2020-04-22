## Subarray Sum Equals K

Given an array of integers and an integer k, you need to find the total number of continuous subarrays whose sum equals to k.

__Example 1:__
```
Input:nums = [1,1,1], k = 2
Output: 2
```

__Note:__
The length of the array is in range `[1, 20,000]`.
The range of numbers in the array is `[-1000, 1000]` and the range of the integer k is `[-1e7, 1e7]`.

---

## SOLUTION

```python
from collections import defaultdict
class Solution:
    def subarraySum(self, nums: List[int], k: int) -> int:
        # Using cumulative sum and hash table 
        sumdict = defaultdict(int)
        sumdict[0] = 1
        cum_sum = 0
        count = 0
        for num in nums:
            cum_sum += num
            if (cum_sum-k) in sumdict:
                count += sumdict[cum_sum-k]
            sumdict[cum_sum] += 1
        return count
    
    # ------------ SOLUTION in O(n*n) --------------
#     def subarraySum(self, nums: List[int], k: int) -> int:
#         count = 0
#         n = len(nums)
#         for i in range(n):
#             sum = 0
#             for j in range(i, n):
#                 sum += nums[j]
#                 if sum == k:
#                     count += 1
#         return count
```

## EXPLANATION

https://www.youtube.com/watch?v=bqN9yB0vF08 
