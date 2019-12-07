# EEG Docker

This project creates a Ubuntu docker image and pushes it to docker.com.
The image is based on rocker/r-ubuntu:18.04  (see https://hub.docker.com/r/rocker/r-ubuntu) and has Ubuntu 18.04 LTS. In addition, several apt and r packages are pre-installed so to run continuous integration on EEG projects using CircleCI. The docker is pubicly available at: https://hub.docker.com/r/manicaeeg/eeg-docker. 

[![CircleCI](https://img.shields.io/circleci/build/github/EvolEcolGroup/EEG_Docker/master?label=build%20%28master%29&logo=circleci&style=plastic&token=0cab61dc3dfa7b884dfe042a40f22d020ba9dc45)](https://circleci.com/gh/EvolEcolGroup/EEG_Docker/tree/master)

## CI tests 

At every commit a test "update_docker" is run, while another two tests are set on manual:
- manual_build_deploy_docker
- manual_test_image

Url for those tests (on circleci) are not posted here since a new manual jobs will be created at each commit. Please, do not bookmark the manual jobs, otherwise you will re-run older version of the repository.
