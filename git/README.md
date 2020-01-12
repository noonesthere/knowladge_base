###### GIT examples
git reset reverts changes by moving a branch reference backwards in time to an older commit:

```
git reset HEAD~1
```
While resetting works great for local branches on your own machine, its method of "rewriting history" doesn't work for remote branches that others are using.

In order to reverse changes and share those reversed changes with others, we need to use git revert. Let's see it in action

```
git revert HEAD
```

git checkout -b # create new branch and checkout 
