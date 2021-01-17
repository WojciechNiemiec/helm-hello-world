Build jar
```shell script
gradlew build jar
```

Build image
```shell script
docker build -t helm-hello-world .
```

Run container
```shell script
docker run -p 8080:8080 helm-hello-world --name helm-hello-world-app
```
