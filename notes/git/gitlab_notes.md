## NOTES ON GITHUB MARKDOWN

### Unordered List with checkbox

- [x] Additional markup is supported, including @mentions, #references, [links](url), **emphasis**, and <del>HTML tags</del>.
- [x] List syntax is required.
  - You can nest lists below, too!
- [x] This item is completed.
- [ ] This item is not complete.

---

### Team @mentions

Typing an `@` symbol, followed by a GitHub username, will send a notification to that person about the comment.

Example: @githubteacher

---

### Summary dropdown

Collapsible summary blocks.

<details>
  <summary>Do you want to explore more?</summary>

  #### Do all kind of Markdowns here

  _Example:_
  Content here

</details>

---
---

## WORKING WITH BINARIES

In general, there are two types of files: __text files__ and __binary files__.

Text files, like most code files, are easily tracked with Git and are very lightweight.

However, binary files like _spreadsheets, presentations with slides, and videos_ don't work well with Git. If your repository already has some of these files, it's best to have a plan in place before you enable Git version control.

You could choose to remove the binary files, or use another tool like `git-lfs` (Git Large File Storage). We won't get into detail on how to set up git-lfs in this course, but we will talk about `.gitignore` files next, which are key to protecting your code from becoming bloated with binaries.

