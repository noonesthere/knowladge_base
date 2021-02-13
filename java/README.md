JVM Runtime:
	* Heap
	* Class loading
	* JIT compilation
	* Threads

###### Native memory tracking 
```
java -XX:NativeMemoryTraking=[summary|detail]
jcmd PID VM.native_memory [detail]
```
>>> If you allocated heap size 10G GC gets more around 2G
###### Allocate initial  and max heap size 4G
```
java -Xmx4G app // max heap size
java  -Xms4G app //initial heap size
```
###### Disable dynamic heap selection memory
```
java -XX:-AdaptiveSizePolicy app
```
###### Allocate all selected memory
```
java -XX:+AlwaysPreTouch app
```
###### Enable gc log (I hope all enabled this on prod
```
Xlog:gc+heap
```
###### Class loader statistics
```
jmap  -clstats PID #jdk8
jcmd PID VM.classloader_stats	# jdk9 +
jcmd PID GC.class_stats # Statistics by all classes
jcmd PID VM.metaspace # Metaspace size (can grow without controlling)
```
