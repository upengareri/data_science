## Search in Rotated Sorted Array

Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

(i.e., `[0,1,2,4,5,6,7]` might become `[4,5,6,7,0,1,2]`).

You are given a target value to search. If found in the array return its index, otherwise return -1.

You may assume no duplicate exists in the array.

Your algorithm's runtime complexity must be in the order of __O(log n)__.

__Example 1:__
```
Input: nums = [4,5,6,7,0,1,2], target = 0
Output: 4
```

__Example 2:__
```
Input: nums = [4,5,6,7,0,1,2], target = 3
Output: -1
```

---

## SOLUTION

```python
class Solution:
    def search(self, nums: List[int], target: int) -> int:
        def search_binary(nums, low, high):
            mid = (low + high) // 2
            # key not present
            if low > high:
                return -1
            # key found
            if nums[mid] == target:
                return mid
            
            # if left is sorted
            if nums[low] <= nums[mid]:
                # if key is present in sorted half
                if nums[low] <= target and nums[mid] > target:
                    return search_binary(nums, low, mid-1)
                # if key is not present in sorted half ... search other half
                else:
                    return search_binary(nums, mid+1, high)
                
            # if right is sorted
            else:
                # if key is present in sorted half
                if target > nums[mid] and target <= nums[high]:
                    return search_binary(nums, mid+1, high)
                # if key is not present in sorted half ... search other half
                else:
                    return search_binary(nums, low, mid-1)
        low = 0
        high = len(nums) - 1
        res = search_binary(nums, low, high)
        return res
    
    # ----------------- ANOTHER SOLUTION --------------
    # class Solution:
    #     def search(self, nums: List[int], target: int) -> int:
    #         low, high = 0, len(nums)-1
    #         while low <= high:
    #             mid = (low + high) // 2
    #             if target == nums[mid]:
    #                 return mid
    #             if nums[low] <= nums[mid]:
    #                 if nums[low] <= target < nums[mid]:  # nice trick here
    #                     high = mid - 1
    #                 else:
    #                     low = mid + 1
    #             else:
    #                 if nums[mid] < target <= nums[high]:
    #                     low = mid + 1
    #                 else:
    #                     high = mid - 1
    #         return -1
                    
        
```

> O(logn): In every iteration, we are traversing for only half the previous iteration
