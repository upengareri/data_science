## Number of Islands

Given a 2d grid map of `'1'`s (land) and `'0'`s (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

__Example 1:__
```
Input:
11110
11010
11000
00000

Output: 1
```
__Example 2:__
```
Input:
11000
11000
00100
00011

Output: 3
```
---

## Solution

```python
class Solution:
    def numIslands(self, grid: List[List[str]]) -> int:
        if not grid:
            return 0
        count = 0
        rows = len(grid)
        cols = len(grid[0])
        for row in range(rows):
            for col in range(cols):
                if grid[row][col] == "1":
                    count += 1
                    self.dfs(grid, rows, cols, row, col)
        return count
    
    def dfs(self, grid, rows, cols, row, col):
        if grid[row][col] == "0":
            return
        grid[row][col] = "0"
        if row != 0:
            self.dfs(grid, rows, cols, row-1, col)
        if row != rows - 1:
            self.dfs(grid, rows, cols, row+1, col)
        if col != 0:
            self.dfs(grid, rows, cols, row, col-1)
        if col != cols - 1:
            self.dfs(grid, rows, cols, row, col+1)
            
# Link for the explanation: https://colorfulcodesblog.wordpress.com/2018/09/06/number-of-islands-tutorial-python/
```
