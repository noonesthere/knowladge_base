### GIT examples

###### git reset reverts changes by moving a branch reference backwards in time to an older commit:

```
git reset HEAD~1
```
>While resetting works great for local branches on your own machine, its method of "rewriting history" doesn't work for remote branches that others are using.

In order to reverse changes and share those reversed changes with others, we need to use git revert. Let's see it in action

###### Revert changes
```
git revert HEAD
```
###### create new branch and checkout 
```
git checkout -b 
```

###### show all branches (remote and local)
```
git branch -a
```
###### show all remote branches
```
git branch -r
``` 
###### show all local branches
```
git branch -l
```
###### Squash last 3 commit into one (local)
```
git reset --soft HEAD~3 && git commit -m "Commit message"
```
