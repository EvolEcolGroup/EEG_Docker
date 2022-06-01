# EEG Docker

Welcome to the docker repository of the [Evolutionary Ecology Group (EEG)](http://www.eeg.zoo.cam.ac.uk/) - [Zoology Department](http://www.zoo.cam.ac.uk), [Cambridge University](http://www.cam.ac.uk).

This project creates a Ubuntu docker image and pushes it to docker.com.
The image is based on Ubuntu LTS and `R`. In addition, several `apt` and `R` packages are pre-installed so to run continuous integration on EEG projects using CircleCI. 
The docker is pubicly available at: https://hub.docker.com/r/manicaeeg/eeg-docker. 

## Getting Started

The images are based on [rstudio/r-docker](https://github.com/rstudio/r-docker) based on Ubuntu 20.04 LTS with r version 4.2. In addition, several `apt` and `R` packages are pre-installed so to run continuous integration on EEG projects using CircleCI. The dockers are generated and updated via a publicly available GitHub repository: https://github.com/EvolEcolGroup/EEG_Docker


### Prerequisities

In order to run this container, you will need docker installed. Based on you OS, you can install it and read a quick guide on the docker.com website:

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

[comment]: <> (### Usage)
[comment]: <> (#### Container Parameters #### Environment Variables #### Volumes #### Useful File Locations)

## Available Images 

You can download `latest` image with

```docker pull manicaeeg/eeg-docker:latest```

Image            | Description                               | Size   | Metrics | Build status 
---------------- | ----------------------------------------- | ------ | ------- | --------------
[latest](https://hub.docker.com/repository/docker/manicaeeg/eeg-docker/) | Main docker | [![](https://img.shields.io/docker/image-size/manicaeeg/eeg-docker/latest?style=plastic)](#) | [![](https://img.shields.io/docker/pulls/manicaeeg/eeg-docker?style=plastic)](#) | [![](https://img.shields.io/docker/automated/manicaeeg/eeg-docker?style=plastic)](#)

Additional statistics on the images can be found on the [Docker](https://hub.docker.com/r/manicaeeg/eeg-docker)

## Available Tags

You can download one of the following tagged images with

```docker pull manicaeeg/eeg-docker:tag_name```

Tag Name         | Description                  | Ubuntu   | R version | Size 
---------------- | ---------------------------- | -------- | --------- | -------
[latest](https://hub.docker.com/repository/docker/manicaeeg/eeg-docker/) | Main image | 20.04 | 4.2 |[![](https://img.shields.io/docker/image-size/manicaeeg/eeg-docker/latest?style=plastic)](#)
[ubuntu20.04r4.2](https://hub.docker.com/repository/docker/manicaeeg/eeg-docker/) | As `latest` | 20.04 | 4.2 |[![](https://img.shields.io/docker/image-size/manicaeeg/eeg-docker/ubuntu20.04r4.2?style=plastic)](#)


[comment]: <> (## Built With)
[comment]: <> (List the software and the version numbers that are in this container v0.3.2)

In the `latest` image, `apt` and `R` packages are automatically updated at the beginning of each month.
In addition to the packages found in the base [rstudio/r-docker](https://github.com/rstudio/r-docker), the additional installed `apt` and `R` packages are listed in the [Dockerfile](https://github.com/EvolEcolGroup/EEG_Docker/blob/master/Dockerfile).

## Run docker locally

Once you downloaded an image (e.g. `docker pull manicaeeg/eeg-docker:latest`), you can use it locally on your shell.
For additional help, refer to the [quick guide to the docker command](Docker-quick-guide.md) markdown page.

## CI tests 

At every commit a test "update_docker" is run, while another two tests are set on manual:
- manual_build_deploy_docker
- manual_test_image

Url for those tests (on circleci) are not posted here since a new manual jobs will be created at each commit. Please, do not bookmark the manual jobs, otherwise you will re-run older version of the repository.

## New dockers

If a new docker needs to be created, remember to change its name and tag in the  `Dockerfile` and `config.yml` so to upload it to docker with a new name/tag. 

### Update the Dockerfile

Example: change Version of r from 3.6. to 4.0 and from Ubuntu 18.04 (bionic) to 20.04 (focal):

```
FROM rstudio/r-base:3.6-bionic 
FROM rstudio/r-base:4.0-focal 
```

For more information see the [r-docker repo readme](https://github.com/rstudio/r-docker)

If you implement other changes, you might want also to update the metatag on the version few lines below:

```
LABEL org.label-schema.schema-version="1.1" \
```
### Update config.yml

Example: change Version of r from 3.6. to 4.0 and from Ubuntu 18.04 (bionic) to 20.04 (focal).
Find the line where the `IMAGE_TAG` is defined:
```
# Common environmental variables
  env_vars: &env_vars
    IMAGE_TAG: ubuntu18.04r3.6     #  Docker version tag :$IMAGE_TAG
    REPO_NAME: eeg-docker
```
and replace it with the new tag in the form of `ubuntu`+ubuntu_version+`r`+r_version. E.g. 
```
    IMAGE_TAG: ubuntu20.04r4.0     #  Docker version tag :$IMAGE_TAG
```

Remember to comment the lines associating the `latest` tag in the older version, while keep it uncommented only in you latest release. 
```
# Add here additional tags for the "latest" release
docker tag $DOCKER_USERNAME/$REPO_NAME:$IMAGE_TAG $DOCKER_USERNAME/$REPO_NAME:latest
docker push $DOCKER_USERNAME/$REPO_NAME:latest 
```
Otherwise, if they are kept uncommented in the older one, and that repo get rebuilt, it would overwrite (and push to docker.com) the actual latest image with the older one.

### Update the readme

Lastly, remember to update this readme.md file to include the new tag in the tag-table. Information on the number of layers comes from [Micro Badger](https://microbadger.com/images/manicaeeg/eeg-docker) that checks and update periodically (i.e. not in real time) the images. Therefore, do not worry if a `no found` layer badge is displayed. You can manually check the number of layers in the [Tags Page](https://hub.docker.com/repository/docker/manicaeeg/eeg-docker/tags) of the   Docker/EEG-Docker website, clicking on the tagged image you are interested.

## First build from new repository branch or new docker 
The first automatic `update_docker` job on the continuous integration will fail becuse there is not yet an image to update.
Indeed, the first build of each new branch needs to be manually triggered with the `manual_build_deploy_docker` job from CircleCi website. If there are no errors, the image is built and push and all the following commits should sucessfully trigger the `update_docker` job.

## Find Us

* [EEG Website](http://www.eeg.zoo.cam.ac.uk/)
* [GitHub](https://github.com/EvolEcolGroup/EEG_Docker)
* [Docker](https://hub.docker.com/r/manicaeeg/eeg-docker)
* [Micro Badger](https://microbadger.com/images/manicaeeg/eeg-docker)

## Contributing

Please read [CONTRIBUTING.md](https://github.com/EvolEcolGroup/EEG_Docker/CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

For the versions available, see the [tags on this repository](https://github.com/EvolEcolGroup/EEG_Docker/tags). 

## Authors

* **Andrea Manica** - *PI*, *Contributor*, *Mantainer* - [GitHub](https://github.com/dramanica)
* **Gian Luigi Somma** - *Initial work*  - [GitHub](https://github.com/orion434)

See also the list of [contributors](https://github.com/EvolEcolGroup/EEG_Docker/graphs/contributors) who 
participated in this project.

## License

[comment]: <> (This project is licensed under the MIT License - )
See the [LICENSE.md](https://github.com/EvolEcolGroup/EEG_Docker/LICENSE.md) file for details.

## Acknowledgments

Part of this readme is based on [Template-README-for-containers.md](https://gist.github.com/PurpleBooth/ea518ae68a49029bae95#file-template-readme-for-containers-md).
