# Setup and deploy mongo



## Overview of the project ##

![overview](/Users/yzhang598/Desktop/devopslab/DevopsLab/notes/k8s/project/overview.png)



## Create MongoDB

### Create mongo.yaml and mongo-secret.yaml

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mongodb-deployment
  labels:
    app: mongodb
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mongodb
  template:
    metadata:
      labels:
        app: mongodb
    spec:
      containers:
      - name: mongodb
        image: mongo
        ports:
        - containerPort: 27017
        env:
        - name: MONGO_INITDB_ROOT_USERNAME
          valueFrom:
            secretKeyRef:
              name: mongodb-secret
              key: mongo-root-username        # data name from mongo-secret.yaml
        - name: MONGO_INITDB_ROOT_PASSWORD
          valueFrom:
            secretKeyRef:
              name: mongodb-secret
              key: mongo-root-password        # data name from mongo-secret.yaml
```

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: mongodb-secret
type: Opaque
data:
  mongo-root-username: bW9uZ28=            # from cmd: echo -n 'mongo' | base64
  mongo-root-password: bW9uZ28=
```

### Apply mongo-secret.yaml and then mongo.yaml ###

```bash
kubectl apply -f mongo-secret.yaml 
kubectl apply -f mongo.yaml
```



## Create Internal service ##

We create Internal service so that other pods can talk to mongodb.

```yaml
---            # in same file -- mongo.ymal
apiVersion: v1
kind: Service
metadata:
  name: mongodb-service
spec:
  selector:
    app: mongodb
  ports:
    - protocol: TCP
      port: 27017        # service port
      targetPort: 27017  # container port of deployment
```

### Apply mongo.yaml and check ###

```bash
kubectl apply -f mongo.yaml
kubectl get service
```



## Create mongo express service & deployment & configMap ##

```yaml
# mongo-express.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mongo-express
  labels:
    app: mongo-express
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mongo-express
  template:
    metadata:
      labels:
        app: mongo-express
    spec:
      containers:
      - name: mongo-express
        image: mongo-express
        ports:
        - containerPort: 8081
        env:
        - name: ME_CONFIG_MONGODB_ADMINUSERNAME       # credential
          valueFrom:
            secretKeyRef:
              name: mongodb-secret
              key: mongo-root-username
        - name: ME_CONFIG_MONGODB_ADMINPASSWORD
          valueFrom: 
            secretKeyRef:
              name: mongodb-secret
              key: mongo-root-password
        - name: ME_CONFIG_MONGODB_SERVER            # which database to connect
          valueFrom: 
            configMapKeyRef:
              name: mongodb-configmap
              key: database_url
---
apiVersion: v1
kind: Service
metadata:
  name: mongo-express-service
spec:
  selector:
    app: mongo-express
  type: LoadBalancer  
  ports:
    - protocol: TCP
      port: 8081
      targetPort: 8081
      nodePort: 30000       # external port open between 30000-32767

```

```yaml
# mongo-configmap.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: mongodb-configmap
data:
  database_url: mongodb-service
```

### Apply mongo-configmap.yaml and then mongo-express.yaml ###

```bash
kubectl apply -f mongo-configmap.yaml
kubectl apply -f mongo-express.yaml
```