## Diameter of Binary Tree

Given a binary tree, you need to compute the length of the diameter of the tree. The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.

__Example:__
Given a binary tree
```
          1
         / \
        2   3
       / \     
      4   5    
```
Return 3, which is the length of the path [4,2,1,3] or [5,2,1,3].

__Note:__ The length of path between two nodes is represented by the number of edges between them.

---

## Solution

```python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution:
    def height(self, node):
        if node is None:
            return 0
        return 1 + max(self.height(node.left), self.height(node.right))
    
    def diameterOfBinaryTree(self, root: TreeNode) -> int:
        if root is None:
            return 0
        lheight = self.height(root.left)
        rheight = self.height(root.right)
        
        ldiameter = self.diameterOfBinaryTree(root.left)
        rdiameter = self.diameterOfBinaryTree(root.right)
        
        return max(lheight + rheight, ldiameter, rdiameter)
```
