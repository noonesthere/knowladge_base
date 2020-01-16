### Gradle:

###### Generate wrapper
```
 /opt/gradle/gradle-5.3/bin/gradle wrapper [version]
 ```

###### Build without test
```
 /opt/gradle/gradle-5.3/bin/gradle project:build -x test
 ```


###### List of guava dependencies conflicts
```
 /opt/gradle/gradle-5.3/bin/gradle -q dependencyInsight --configuration compile --dependency guava
```


