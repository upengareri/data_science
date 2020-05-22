## Minimum Path Sum

Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.

Note: You can only move either down or right at any point in time.
```
Example:

Input:
[
  [1,3,1],
  [1,5,1],
  [4,2,1]
]
Output: 7
Explanation: Because the path 1→3→1→1→1 minimizes the sum.
```

---

## Solution

```python
class Solution:
    def minPathSum(self, grid: List[List[int]]) -> int:
        rows = len(grid)
        cols = len(grid[0])
        dp = [[0]*cols]*rows  # it can be solved by dynamic programming
        dp[0][0] = grid[0][0]
        for row in range(rows):
            if row > 0:
                dp[row][0] = grid[row][0] + dp[row-1][0]  # handle 0th column
            for col in range(1, cols):
                if row == 0:
                    dp[0][col] = grid[0][col] + dp[0][col-1]  # handle 0th row
                else:
                    dp[row][col] = grid[row][col] + min(dp[row-1][col], dp[row][col-1])
        return dp[rows-1][cols-1]
```
