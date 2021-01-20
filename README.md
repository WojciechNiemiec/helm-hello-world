# Helm Hello World

### Build jar
Generates jar file under build/libs path.
```shell script
gradlew build jar
```

### Build image
Builds docker image. Requires a jar file.
```shell script
docker build -t REPOSITORY_NAME .
```

### Run container
Runs container and exposes it under port 8080. Not required for Helm deployment. Requires the docker image.
```shell script
docker run -p 8080:8080 REPOSITORY_NAME --name helm-hello-world-app
```

### Push image
Pushes image to docker repository. Requires the docker image.
```shell script
docker push REPOSITORY_NAME
```

### Deploy using Helm
Creates new Kubernetes deployment named *helm-hello-world*. Requires docker image to be published present in a repository.
```shell script
helm install helm-hello-world chart
```

### Deploy using Helm with additional parameters
Deploys the app and injects *image.repository* property to values.yaml.
```shell script
helm install --set image.repository=REPOSITORY_NAME -helm-hello-world chart
```

### Pod level call
Calls deployed pod from the cluster level.
```shell script
kubectl exec POD_NAME -- curl http://POD_NAME:8080
```

### Run Helm tests
Executes tests specified under chart/templates/tests. Requires successful deployment.
```shell script
helm test helm-hello-world
```

### Forward ports to host machine
Makes the app visible from host machine. Note Kubernetes adds *-chart* suffix to deployment name.
```shell script
kubectl port-forward deployment/helm-hello-world-chart 80:80
```
