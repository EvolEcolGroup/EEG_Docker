# EEG Docker

This project creates a Ubuntu docker image and pushes it to docker.com.
The image is based on manicaeeg/eeg-docker (see https://hub.docker.com/r/manicaeeg/eeg-docker) and has Ubuntu 18.04 LTS. In addition, several apt and r packages are pre-installed so to run continuous integration on the EEG [mtDNAcombine](https://github.com/EvolEcolGroup/mtDNAcombine) project via CircleCI. The docker is pubicly available at: https://hub.docker.com/r/manicaeeg/eeg-mt-dna-combine

[![CircleCI](https://img.shields.io/circleci/build/github/EvolEcolGroup/EEG_Docker/mtDNAcombine?label=build%20%28mtDNAcombine%29&logo=circleci&style=plastic&token=0cab61dc3dfa7b884dfe042a40f22d020ba9dc45)](https://circleci.com/gh/EvolEcolGroup/EEG_Docker/tree/mtDNAcombine)

## CI tests 

At every commit a test "update_docker" is run, while another two tests are set on manual:
- manual_build_deploy_docker
- manual_test_image

Url for those tests (on circleci) are not posted here since a new manual jobs will be created at each commit. Please, do not bookmark the manual jobs, otherwise you will re-run older version of the repository.
