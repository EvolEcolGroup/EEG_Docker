# Quick guide to the docker command 

## Introduction
Info on the `docker` usage, command, options, and parameters can be obtained running
```
$docker help
```
or on the [Reference documentation](https://docs.docker.com/reference/) on the docker.com website.

Among the commands (execute in the shell as `docker command_name`), those are the usefull ones:

Command | Description
--------| ------------------------
build       |Build an image from a Dockerfile
images      |List images
ps          |List containers
restart     |Restart one or more containers
run         |Run a command in a new container
stats       |Display a live stream of container(s) resource usage statistics
stop        |Stop one or more running containers

## The docker service

In the shell, you can check the status of the docker service running (you might need to `sudo` it) using
```
$ service docker status
```
If the docker service is not running, you can start it with (you might need to `sudo` it)
```
$ service docker start
```

## Images and containers

You can have a list of the downloaded images and containers, respectivelly via

```
$ docker images
$ docker ps
``` 
If the `images` command output an empty list it means that you have not downloaded  any image yet. But you should have a demo `hello-world` one already installed by default.
If the `ps` command output an empty list it means that you have not run any container yet.

You can download a specific tagged image with 

```
$ docker pull manicaeeg/eeg-docker:tag_name
```

E.g:

```
$ docker pull manicaeeg/eeg-docker:latest
$ docker pull manicaeeg/eeg-docker:ubuntu18.04r4.0
$ docker pull manicaeeg/eeg-docker:ubuntu18.04r3.6
```

## Run an image

To run a specific image in a new container (i.e. a new local virtual machine that run the selected image) you can use:

```
$ docker run [OPTIONS] IMAGE[:TAG|@DIGEST] [COMMAND] [ARG...]
```
Where the `IMAGE[:TAG|@DIGEST]` is among those downloaded and listed with `docker images`.
E.g. (the order of parameters is important!)
```
$ docker run --name container_custom_name -it  manicaeeg/eeg-docker:latest
```
With the `-it` flag you will enter directly into the shell of the newly started container shell. To exit the container, you just need to write in the shell: `exit`. This will shut down the container.

For more info on the `run` command, see its [Reference page](https://docs.docker.com/engine/reference/run/) on the docker website.

## Interact with the container

You can also control its execution from another instance of the shell. There you can verify running `docker ps` that the previous command actually was executed correctly and a new container is now present with the name you just set.

You can start, stop and restart the container without enter its shell with:
```
sudo docker start eeg-docker -i
sudo docker stop eeg-docker
sudo docker restart eeg-docker
```

You can enter a running container in one those two way:

```
docker exec -it container_id bash
docker exec -it container_custom_name base
```
where the `container_custom_name` is the custom one you specified in the `run` command with `--name container_custom_name`.

You can then run commands in this container (e.g. clone locally a git repository) and perform tests locally.


## docker help

For reference, this is the output of the `docker help` command:

```
Usage:  docker [OPTIONS] COMMAND

A self-sufficient runtime for containers

Options:
      --config string      Location of client config files (default "/home/orion42/.docker")
  -c, --context string     Name of the context to use to connect to the daemon (overrides DOCKER_HOST env var and        
                           default context set with "docker context use")
  -D, --debug              Enable debug mode
  -H, --host list          Daemon socket(s) to connect to
  -l, --log-level string   Set the logging level ("debug"|"info"|"warn"|"error"|"fatal") (default "info")
      --tls                Use TLS; implied by --tlsverify
      --tlscacert string   Trust certs signed only by this CA (default "/home/orion42/.docker/ca.pem")
      --tlscert string     Path to TLS certificate file (default "/home/orion42/.docker/cert.pem")
      --tlskey string      Path to TLS key file (default "/home/orion42/.docker/key.pem")
      --tlsverify          Use TLS and verify the remote
  -v, --version            Print version information and quit

Management Commands:
  builder     Manage builds
  config      Manage Docker configs
  container   Manage containers
  context     Manage contexts
  engine      Manage the docker engine
  image       Manage images
  network     Manage networks
  node        Manage Swarm nodes
  plugin      Manage plugins
  secret      Manage Docker secrets
  service     Manage services
  stack       Manage Docker stacks
  swarm       Manage Swarm
  system      Manage Docker
  trust       Manage trust on Docker images
  volume      Manage volumes

Commands:
  attach      Attach local standard input, output, and error streams to a running container
  build       Build an image from a Dockerfile
  commit      Create a new image from a container's changes
  cp          Copy files/folders between a container and the local filesystem
  create      Create a new container
  diff        Inspect changes to files or directories on a container's filesystem
  events      Get real time events from the server
  exec        Run a command in a running container
  export      Export a container's filesystem as a tar archive
  history     Show the history of an image
  images      List images
  import      Import the contents from a tarball to create a filesystem image
  info        Display system-wide information
  inspect     Return low-level information on Docker objects
  kill        Kill one or more running containers
  load        Load an image from a tar archive or STDIN
  login       Log in to a Docker registry
  logout      Log out from a Docker registry
  logs        Fetch the logs of a container
  pause       Pause all processes within one or more containers
  port        List port mappings or a specific mapping for the container
  ps          List containers
  pull        Pull an image or a repository from a registry
  push        Push an image or a repository to a registry
  rename      Rename a container
  restart     Restart one or more containers
  rm          Remove one or more containers
  rmi         Remove one or more images
  run         Run a command in a new container
  save        Save one or more images to a tar archive (streamed to STDOUT by default)
  search      Search the Docker Hub for images
  start       Start one or more stopped containers
  stats       Display a live stream of container(s) resource usage statistics
  stop        Stop one or more running containers
  tag         Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
  top         Display the running processes of a container
  unpause     Unpause all processes within one or more containers
  update      Update configuration of one or more containers
  version     Show the Docker version information
  wait        Block until one or more containers stop, then print their exit codes

Run 'docker COMMAND --help' for more information on a command.
```