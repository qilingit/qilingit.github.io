---
layout: post
title: "Work with Bitbucket"
date: 2018-07-12
categories: Study
tags :
- Version Control
- Bitbucket
---

# Begin to work with Bitbucket

<!-- more -->

## Step of how to add local folder or file to remote Repositories ?

1. Create an empty Repository in Bitbucket

   ![bitbucketEmptyRepos](/images/bitbucketEmptyRepos.PNG)

2. After create this empty repository, in the page of overview, we can see this indication below :

   ![bitbucket_addLocalFile](/images/bitbucket_addLocalFile.PNG)

3. Go to the folder that you want to add to the repository, create the `.git` folder to initialize `git`workspace: 

   `git init`

4. Create `.gitignore` file to avoid upload inuse file :

   `touch .gitignore`

5. Add files to git

   `git add *`

6. Verity all of file needed have added:

   `git status`

7. Need first commit before add remote repository, this step is very important : 

   `git commit -m "Init commit" `

8. As step 3 says, add remote repository to current folder : 

   `git remote add origin https://your_bitbucket_name@bitbucket.org/your_bitbucket_name/test.git`

9. Last step, push:

   `git push -u origin master`