## Binary Tree Maximum Path Sum

Given a non-empty binary tree, find the maximum path sum.

For this problem, a path is defined as any sequence of nodes from some starting node to any node in the tree along the parent-child connections. The path must contain __at least one node__ and does not need to go through the root.

__Example 1:__
```
Input: [1,2,3]

       1
      / \
     2   3

Output: 6
```
__Example 2:__
```
Input: [-10,9,20,null,null,15,7]

   -10
   / \
  9  20
    /  \
   15   7

Output: 42
```
---

## SOLUTION

```python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def maxPathSum(self, root: TreeNode) -> int:
        self.maximum = float("-inf")
        def dfs(root):
            if root is None:
                return 0
            max_left = max(0, dfs(root.left))
            max_right = max(0, dfs(root.right))
            self.maximum = max(self.maximum, root.val+max_left+max_right)
            return max(max_left, max_right) + root.val
        dfs(root)
        return self.maximum
```
---

Notice how infinity and negative infinity is defined.

Also, why we are using `self.maximum` and not `maximum` (if not self then the internal dfs function will complain `maximum` used before assignment)
