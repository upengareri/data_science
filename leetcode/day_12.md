## Last Stone Weight

We have a collection of stones, each stone has a positive integer weight.

Each turn, we choose the two heaviest stones and smash them together.  Suppose the stones have weights x and y with x <= y.  The result of this smash is:

* If `x == y`, both stones are totally destroyed;
* If `x != y`, the stone of weight x is totally destroyed, and the stone of weight y has new weight y-x.

At the end, there is at most 1 stone left.  Return the weight of this stone (or 0 if there are no stones left.)

__Example 1:__
```
Input: [2,7,4,1,8,1]
Output: 1
Explanation: 
We combine 7 and 8 to get 1 so the array converts to [2,4,1,1,1] then,
we combine 2 and 4 to get 2 so the array converts to [2,1,1,1] then,
we combine 2 and 1 to get 1 so the array converts to [1,1,1] then,
we combine 1 and 1 to get 0 so the array converts to [1] then that's the value of last stone.
```

__Note:__

* `1 <= stones.length <= 30`
* `1 <= stones[i] <= 1000`

---

## Solution

```python
class Solution:
    def lastStoneWeight(self, stones: List[int]) -> int:
        def pop_max(stones):
            max_val = max(stones)
            if max_val:
                return stones.pop(stones.index(max_val))
            return 0
        while (len(stones) > 1):
            y = pop_max(stones)
            x = pop_max(stones)
            if y !=x:
                stones.append(y-x)
        res = stones[0] if stones else 0
        return res
```
