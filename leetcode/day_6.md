## Group Anagrams

Given an array of strings, group anagrams together.

__Example:__
```
Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
Output:
[
  ["ate","eat","tea"],
  ["nat","tan"],
  ["bat"]
]
```
Note:

* All inputs will be in lowercase.
* The order of your output does not matter.

---
## Solution

```python
from collections import defaultdict
class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        res_dict = defaultdict(list)
        for item in strs:
            s_item = "".join(sorted(item))
            res_dict[s_item].append(item)
        return [value for value in res_dict.values()]
```
