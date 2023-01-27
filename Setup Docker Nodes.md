# Setup Docker Containers as Build Agents for Jenkins



## Prerequisites:

- Docker host (open port 4243 and  32768 to 60999)

- Jenkins host

    

## Step1: Configure a Docker Host With Remote API

### 1. Change the docker service file

Login docker host, path: `/lib/systemd/system/docker.service` in the file sreach for `ExecStart` and replace the line with the following:

```bash
ExecStart=/usr/bin/dockerd -H tcp://0.0.0.0:4243 -H 
unix:///var/run/docker.sock
```

### 2. Reload and restart docker service

```bash
systemctl daemon-reload
service docker restart
```

### 3. Check API works

```bash
curl http://localhost:4243/version                       # for docker host
curl http://44.208.72.178:4243/version                   # for jenkins host, replace ip with docker host ip
```



## Step2: Create or use a Jenkins Agent Docker Image

There are two options create own Docker image or we can use [**jenkins/ssh-agent**](https://hub.docker.com/r/jenkins/ssh-agent) (Docker image for Jenkins agents connected over SSH) and motifiy the image.

If we want to create own Docker image, we need:

- `sshd` service running on port 22.

- Jenkins user with password.

- All the required application dependencies for the build. For example, for a java maven project, you need to have git, java, and maven installed on the image.
- Expose port 22.

Here is an example of create ssh agent Docker image use [Dockerfile](https://github.com/bibinwilson/jenkins-docker-slave/blob/master/Dockerfile).



## Step3: Configure Jenkins Server With Docker Plugin

### 1. Install Docker plugin in Jenkins host

### 2. Configure cloulds

Under Manage Jenkins –> Manage Nodes and Clouds -> Configure cloulds ->  docker:

- Under **Docker host detail**:

​			change Docker Host URI to `tcp://44.208.72.178:4243` change ip to docker host url

​			Select **Enabled** and **Expose DOCKER_HOST**

- Under **Docker Agent Template**

    - give the **Labels**, **Name** and **Docker Image**

    - change **Remote File System Root** to `/home/jenkins` (`/home/jenkins/agent`if use **jenkins/ssh-agent** )

    - ( if use **jenkins/ssh-agent** under **container setting -> Enveronment** we need to copy the pub key from jenkins host,    	jenkins user  `.ssh/id_rsa.pub` and provide the key: `JENKINS_AGENT_SSH_PUBKEY=<YOUR PUBLIC SSH KEY HERE>` )

    - **Connect method** choose **connect with ssh**

    - under **SSH key** choose ssh credentials for jenkins user

    - ( if use **jenkins/ssh-agent** choose **inject SSH key** and change **User** to `jenkins` )

    - provide **Tool Locations** if necessary (`which git`, `mvn -version`)

        

## Step 4: Test Jenkins Build Inside a Docker container

### 1. Create a freestyle job, select `Restrict where this project can be run` option and select the docker host as a node using the label.

### 2. Add a shell build step which echoes a simple `Hello World`.



## [Related article](https://devopscube.com/docker-containers-as-build-slaves-jenkins/)