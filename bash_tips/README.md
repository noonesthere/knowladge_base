##### Bash tips

Show only error and warn messges
```
grep -E 'ERROR|WARN'
```


```
wget -r -p -U Mozilla http://www.stupidsite.com/restricedplace.html
```

Show duplicate lines in current files
```
grep PORT ./* | uniq -d
grep PORT ./* | cut -d '=' -f 2 | uniq -d
```
