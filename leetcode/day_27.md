## Maximal Square

Given a 2D binary matrix filled with 0's and 1's, find the largest square containing only 1's and return its area.

__Example:__
```
Input:

1 0 1 0 0
1 0 1 1 1
1 1 1 1 1
1 0 0 1 0

Output: 4
```
---
## SOLUTION

```python
class Solution:
    def maximalSquare(self, matrix: List[List[str]]) -> int:
        rows = len(matrix)
        if rows == 0: return 0
        cols = len(matrix[0])
        dp = [[0]*(cols+1) for _ in range(rows+1)]  # create extra 0's around the matrix 
        result = 0
        for i in range(1,rows+1):
            for j in range(1, cols+1):
                if matrix[i-1][j-1] == "1":
                    prev_col= int(dp[i][j-1])
                    prev_row = int(dp[i-1][j])
                    prev_row_col = int(dp[i-1][j-1])
                    dp[i][j] = min(prev_col, prev_row, prev_row_col) + 1
                    result = max(result, dp[i][j])
        return result ** 2
```
---
Link for explanation:

https://www.youtube.com/watch?v=rMw2cnpmP-4
