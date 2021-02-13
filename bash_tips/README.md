##### Bash tips

Show only error and warn messges
```
grep -E 'ERROR|WARN'
```

Pring first and six column of line
```
awk '{print $1 $6}'
```
```
wget -r -p -U Mozilla http://www.stupidsite.com/restricedplace.html
```

Show duplicate lines in current files
```
grep PORT ./* | uniq -d
grep PORT ./* | cut -d '=' -f 2 | uniq -d
```
###### Check memory
```
top -o %MEM
```
###### Memory statistics
/proc/meminfo

###### Virtual memory map of process
/proc/PID/maps
/proc/PID/smaps

man procfs

pmap  -x PID

