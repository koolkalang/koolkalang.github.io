---
layout: post
title: Blogging In Four Steps
tags:
- process
- python
- bash
---
So, I did some work to try and streamline and take the headache out of pushing out a simple blog post. It involves a lot of aliases in .bashrc, and a rather crappy python script to automate the title posts.  

* `post` -  brings up vim and opens a file simply called 'post'. The first line is reserved for the title, and the second line is for tags, seperated by spaces. The rest of the file is simply the blog content.  
* `review` - This opens up a localhost version of the blog, and does a python script and a few git commands to get the source ready for commit.  
* `commit` - This is just a regular commit, but it needs a message with it to compile. I figured the comments on the source branch  would matter more than the commits on the master branch, so I just abstracted the master commit branch away in aliases.  
* `push` - Does a lot of the heavy lifting - it moves the generated _site foler to the master branch, automatically commits that, and pushes both the master and source branches.  

This is the first post that uses this new process fully, so I hope that this new process makes me a more productive blogger.  

EDIT: This post and review workflow seems to work very well, I hope I can use this a lot more frequently.

---