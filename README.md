# EEG Docker

Welcome to the docker repository of the [Evolutionary Ecology Group (EEG)](http://www.eeg.zoo.cam.ac.uk/) - [Zoology Department](http://www.zoo.cam.ac.uk), [Cambridge University](http://www.cam.ac.uk).

This project creates a Ubuntu docker image and pushes it to docker.com.
The image is based on Ubuntu LTS a r (various versions). In addition, several apt and r packages are pre-installed so to run continuous integration on EEG projects using CircleCI. 
The docker is pubicly available at: https://hub.docker.com/r/manicaeeg/eeg-docker. 

## Getting Started

The images are based on [rstudio/r-docker](https://github.com/rstudio/r-docker) based on Ubuntu 18.04 LTS with r version 4 (or 3.6 as legacy image). In addition, several apt and r packages are pre-installed so to run continuous integration on EEG projects using CircleCI. The dockers are generated and updated via a publicly available GitHub repository: https://github.com/EvolEcolGroup/EEG_Docker


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
[latest](https://hub.docker.com/repository/docker/manicaeeg/eeg-docker/) | Main docker | ![](https://img.shields.io/docker/image-size/manicaeeg/eeg-docker/latest?style=plastic) | ![](https://img.shields.io/docker/pulls/manicaeeg/eeg-docker?style=plastic) | ![](https://img.shields.io/docker/automated/manicaeeg/eeg-docker?style=plastic)

Additional statistics on the images can be found on the [Docker](https://hub.docker.com/r/manicaeeg/eeg-docker) and [Micro Badger](* [Micro Badger](https://microbadger.com/images/manicaeeg/eeg-docker)) wesbsites.

## Available Tags

You can download one of the following tagged images with

```docker pull manicaeeg/eeg-docker:tag_name```

Tag Name        | Description                               |Ubuntu | R version | Size   | Layers
---------------- | ----------------------------------------- | -------- | ------| ------- | ------- 
[latest](https://hub.docker.com/repository/docker/manicaeeg/eeg-docker/) | Main image | 18.04 | 4.0 |![](https://img.shields.io/docker/image-size/manicaeeg/eeg-docker/latest?style=plastic) | ![](https://img.shields.io/microbadger/layers/manicaeeg/eeg-docker/latest?style=plastic) 
[ubuntu18.04r3.6](https://hub.docker.com/repository/docker/manicaeeg/eeg-docker/) | Legacy tag with R version 3.6 | 18.04 | 3.6 | ![](https://img.shields.io/docker/image-size/manicaeeg/eeg-docker/ubuntu18.04r3.6?style=plastic) | ![](https://img.shields.io/microbadger/layers/manicaeeg/eeg-docker/ubuntu18.04r3.6?style=plastic)
[ubuntu18.04r4.0](https://hub.docker.com/repository/docker/manicaeeg/eeg-docker/) | As `latest` | 18.04 | 4.0 |![](https://img.shields.io/docker/image-size/manicaeeg/eeg-docker/ubuntu18.04r4.0?style=plastic) | ![](https://img.shields.io/microbadger/layers/manicaeeg/eeg-docker/ubuntu18.04r4.0?style=plastic) 


[comment]: <> (## Built With)
[comment]: <> (List the software and the version numbers that are in this container v0.3.2)

In the `latest image`, Apt and R packages are automatically updated at the beginning of each month.
In addition to the packages found in the base [rstudio/r-docker](https://github.com/rstudio/r-docker), the additinal installed `apt` and `R` packages are listed in the [Dockerfile](https://github.com/EvolEcolGroup/EEG_Docker/blob/master/Dockerfile).

## Run docker locally

Once you downloaded an image (e.g. `docker pull manicaeeg/eeg-docker:latest`), you can use it locally on your shell.
For additional help, refer to the [quick guide to the docker command](Docker-quick-guide.md) markdown page.

## CI tests 

At every commit a test "update_docker" is run, while another two tests are set on manual:
- manual_build_deploy_docker
- manual_test_image

Url for those tests (on circleci) are not posted here since a new manual jobs will be created at each commit. Please, do not bookmark the manual jobs, otherwise you will re-run older version of the repository.

## New dockers

If a new docker needs to be created, remember to change its name and tag in the `config.yml` so to upload it to docker with a new name/tag.

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

* **Andrea Manica** - *PI*, *Contributor* - [GitHub](https://github.com/dramanica)
* **Gian Luigi Somma** - *Initial work* , *Mantainer* - [GitHub](https://github.com/orion434)

See also the list of [contributors](https://github.com/EvolEcolGroup/EEG_Docker/graphs/contributors) who 
participated in this project.

## License

[comment]: <> (This project is licensed under the MIT License - )
See the [LICENSE.md](https://github.com/EvolEcolGroup/EEG_Docker/LICENSE.md) file for details.

## Acknowledgments

Part of this readme is based on [Template-README-for-containers.md](https://gist.github.com/PurpleBooth/ea518ae68a49029bae95#file-template-readme-for-containers-md).