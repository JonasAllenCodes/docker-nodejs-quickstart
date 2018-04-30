# Basic Node.js Docker Quickstart
This is a simple Docker Container to be used as start to a Node.js project within a Docker container.

Github: [https://github.com/JonasAllenCodes/docker-nodejs-quickstart](https://github.com/JonasAllenCodes/docker-nodejs-quickstart)

Docker Hub: [https://hub.docker.com/r/jonasallencodes/docker-nodejs-quickstart/](https://hub.docker.com/r/jonasallencodes/docker-nodejs-quickstart/)

## Requirements
* Docker

## Install Project NPM Packages
You will need to make a "package.json" file before starting this container. As an option, you can create the "package-lock.json" file now. If you look into the "Dockerfile", you will see it copies the files over into the container and runs `npm install`. This will create the "package-lock.json" file, if not created yet. After that it copies the rest of the project files into the container and will finish initializing the container.

> ### package.json Requirements
>> Your "package.json" will need to have a script that runs a command that will start your app. "Dockerfile" assumes your script name to run the script is "start". If you would like to use a different name you will need to update the "package.json" file accordingly. If you are not ready to have a "start" script within your "package.json" file, you can comment out the line, `CMD ["npm", "start"]`, within the "Dockerfile".

## Run Container from my Docker Cloud Repository

Run in project directory on your command line:

$ `docker run -p 29170:80 -d jonasallencodes/docker-nodejs-quickstart`

If you want to run the container in detached mode (run in the background), make sure to include the -d tag. Next you will need the -p tag, this tag routes the exposed container port to the host machines port. So "29170" is the port that is forwarding to the container's exposed port "80". You must keep the port "80" as it is the port exposed in the "Dockerfile". Now you may need to change the port being used on the host machine if it is already being used or for other reasons. To do so you only need to change "29170" in the above command.

**IF YOU FOLLOW THIS METHOD YOU DO NOT NEED TO BUILD AND RUN THE CONTAINER ON YOUR MACHINE.**

If you would like to stop your container follow below steps.

1. Run $ `docker container ls`, this will list all running containers. 
     
    You will see something simular to this:

    ```
    CONTAINER ID        IMAGE               COMMAND             CREATED

    1fa4ab2cf395        friendlyhello       "python app.py"     28 seconds ago
    ```

1. Run $ `docker container stop <container-id>`, replace `<container-id>` with the container id that we got in the last step.

## Build and Run the Container on your Machine
Now to build the container image run:

$ `docker build -t <image-name>`

Replace `<image-name>` with the real name of your container.

Example: $ `docker build -t docker-nodejs-quickstart .`

To list all Docker images, run:

$ `docker image ls`

You should see something like this:

```
REPOSITORY                      TAG                 IMAGE ID
docker-nodejs-quickstart         latest              326387cea398
```

In order to run the container image, run:

$ `docker run -p 29170:80 -d <image-name>`

eplace `<image-name>` with the real name of your container.

Example: $ `docker run -p 29170:80 -d docker-nodejs-quickstart`

If you want to run the container in detached mode (run in the background), make sure to include the -d tag. Next, you will need the -p tag, this tag routes the exposed container port to the host machines port. So "29170" is the port that is forwarding to the container's exposed port "80". You must keep the port "80" as it is the port exposed in the "Dockerfile". If you want to change the container's exposed port you will need to also change in the "Dockerfile" after "EXPOSE". Now you may need to change the port being used on the host machine if it is already being used or for other reasons. To do so you only need to change "29170" in the above command.

## Stop Running Container
If you would like to stop your container follow below steps.

1. Run $ `docker container ls`, this will list all running containers. 
     
    You will see something simular to this:

    ```
    CONTAINER ID        IMAGE               COMMAND             CREATED

    1fa4ab2cf395        friendlyhello       "python app.py"     28 seconds ago
    ```

1. Run $ `docker container stop <container-id>`, replace `<container-id>` with the container id that we got in the last step.

## Add the Built Container to your Docker Cloud

### Login
If you don’t have a Docker account, sign up for one at [cloud.docker.com](cloud.docker.com). Make note of your username.

Log in to the Docker public registry on your local machine.

Run, $ `docker login`

Follow login instructions.

Now you are logged in under your Docker Cloud account.

### Tag the Image
The notation for associating a local image with a repository on a registry is username/repository:tag. The tag is optional, but recommended, since it is the mechanism that registries use to give Docker images a version. Give the repository and tag meaningful names for the context, such as docker-nodejs-quickstart:0.0.1. This puts the image in the get-started repository and tag it as 0.0.1.

Now, put it all together to tag the image. Run docker tag image with your username, repository, and tag names so that the image uploads to your desired destination. The syntax of the command is:

$ `docker tag image username/repository:tag`

For example run:

$ `docker tag docker-nodejs-quickstart jonasallencodes/docker-nodejs-quickstart:0.0.1`

Run $ `docker image ls`, this will show you a list of docker images on your machine. You will see your new tag on the image.

### Publish the Image
Upload your tagged image to the repository, by running:

$ `docker push username/repository:tag`

For example run:

$ `docker push docker-nodejs-quickstart jonasallencodes/docker-nodejs-quickstart:0.0.1`

Once complete, the results of this upload are publicly available. If you log in to [Docker Hub](https://hub.docker.com/), you see the new image there, with its pull command.

### Pull and Run Docker Cloud Repository

From now on, you can use docker run and run your app on any machine with this command:

$ `docker run -p 29170:80 -d username/repository:tag`

Replace "username/repository:tag" accordingly. If you want to run the container in detached mode (run in the background), make sure to include the -d tag. Next you will need the -p tag, this tag routes the exposed container port to the host machines port. So "29170" is the port that is forwarding to the container's exposed port "80". You must keep the port "80" as it is the port exposed in the "Dockerfile". If you want to change the container's exposed port you will need to also change in the "Dockerfile" after "EXPOSE". Now you may need to change the port being used on the host machine if it is already being used or for other reasons. To do so you only need to change "29170" in the above command.

## Credit
Parts of this came from instructions at, [https://docs.docker.com/get-started/part2/](https://docs.docker.com/get-started/part2/).