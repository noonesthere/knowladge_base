###### Create app
```
sencha -sdk ~/<path-to-ext-sdk> generate app -ext MyApp ./my-app
```

##### Create view 
```
sencha generate view main.Main
```

##### Create controller
```
sencha generate controller MyController
```

###### Run simple server
```
sencha web start
```
###### Run simple server with specified port
```
sencha web -port 1999 start
```

###### After changed refresh 
```
sencha app refresh
```
or
```
sencha app watch
```