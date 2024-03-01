
#  Git Tutorial for Team Collaboration
This tutorial provides step-by-step instructions on using Git for team collaboration and pushing changes to a forked repository.

## Authors

- [@HyUvscode](https://github.com/HyUvscode)



### Forking the Repository
1. Go to the original repository on GitHub.
2. Click on the "Fork" button to create a copy of the repository on your GitHub account.

### 2. Cloning the Fork

Clone the forked repository to your local machine using the following command:
```bash
    git clone <URL of the forked repository>
```

### Creating a Pull Request
1. Push your changes to your forked repository.
2. Go to your forked repository on GitHub and click on the "New pull request" button.
3. Follow the prompts to create a pull request to merge your changes into the original repository.

### Updating from the Original Repository (Optional)

Add the original repository as an upstream remote using the following command:
```bash
git remote add upstream <URL of the original repository>
```

### Create and switch to a branch
Before starting work, create a new branch from the main branch (usually main or master) to work on.
```bash
git checkout -b <new branch name>

example: git checkout -b khuy
```

### Make changes
Make necessary changes to the repository on your computer using git commands such as git add, git commit, and git push.

1. git add
```bash
git add <path>
```
2. git commit
```bash
git commit -m "message"
```
#### note:
If working, you need to clearly state the commit, for example:
+ When adding a file, specify -m "add main.py"
+ When changing functions or fixing or deleting, it is also necessary to clearly state what to do with which file.
3. git push
Once you have completed the changes and want to push them to your forked repository on GitHub, use the git push command.
```bash
git push origin <branch name>
```
