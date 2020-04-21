## Leftmost Column with at Least a One

(This problem is an interactive problem.)

A binary matrix means that all elements are 0 or 1. For each individual row of the matrix, this row is sorted in non-decreasing order.

Given a row-sorted binary matrix binaryMatrix, return leftmost column index(0-indexed) with at least a 1 in it. If such index doesn't exist, return -1.

You can't access the Binary Matrix directly.  You may only access the matrix using a `BinaryMatrix` interface:

* `BinaryMatrix.get(x, y)` returns the element of the matrix at index `(x, y)` (0-indexed).
* `BinaryMatrix.dimensions()` returns a list of 2 elements `[n, m]`, which means the matrix is n * m.
Submissions making more than `1000` calls to BinaryMatrix.get will be judged Wrong Answer.  Also, any solutions that attempt to circumvent the judge will result in disqualification.

For custom testing purposes you're given the binary matrix mat as input in the following four examples. You will not have access the binary matrix directly.

__Example 1:__
```
Input: mat = [[0,0],[1,1]]
Output: 0
```
__Example 2:__
```
Input: mat = [[0,0],[0,1]]
Output: 1
```
__Example 3:__
```
Input: mat = [[0,0],[0,0]]
Output: -1
```
__Example 4:__
```
Input: mat = [[0,0,0,1],[0,0,1,1],[0,1,1,1]]
Output: 1
```
![](./images/leftmost_col.jpg)

Constraints:

* `1 <= mat.length, mat[i].length <= 100`
* `mat[i][j]` is either `0` or `1`.
* `mat[i]` is sorted in a non-decreasing way.

---

## SOLUTION

```python
# """
# This is BinaryMatrix's API interface.
# You should not implement it, or speculate about its implementation
# """
#class BinaryMatrix(object):
#    def get(self, x: int, y: int) -> int:
#    def dimensions(self) -> list[]:

class Solution:
    def leftMostColumnWithOne(self, binaryMatrix: 'BinaryMatrix') -> int:
        rows, columns = binaryMatrix.dimensions()
        candidate_col = -1
        candidate_col = self.binary_search(binaryMatrix, 0, columns-1, candidate_col)
        return candidate_col
        
    def binary_search(self, binaryMatrix, start, end, candidate_col):
        if start > end:
            return candidate_col
        mid = (start + end) // 2
        if self.are_all_zeros(binaryMatrix, mid):
            return self.binary_search(binaryMatrix, mid+1, end, candidate_col)
        else:
            candidate_col = mid
            return self.binary_search(binaryMatrix, start, mid-1, candidate_col)
        
    def are_all_zeros(self, binaryMatrix, mid):
        rows, _ = binaryMatrix.dimensions()
        row = 0
        while row < rows:
            if binaryMatrix.get(row, mid) == 1:
                return False
            row += 1
        return True
```


USEFUL EXPLANATION:

https://www.youtube.com/watch?v=gaPg_iQZchY
