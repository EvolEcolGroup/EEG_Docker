# Pull base image
# To install, use the explicit LTS tag---currently 18.04---when pulling
# https://hub.docker.com/r/rocker/r-ubuntu
#FROM rocker/r-ubuntu:18.04 
FROM manicaeeg/ubuntu-lts-r:latest
# This docker is available at https://hub.docker.com/repository/docker/manicaeeg/ubuntu-lts-r


ARG BUILD_DATE
ARG VCS_REF
# ARG IMG_DIST
# ARG BUILD_VERSION

# Labels
LABEL maintainer="Gian Luigi Somma"
LABEL org.label-schema.schema-version = "1.0"
LABEL org.label-schema.name = "R-Ubuntu-Docker"
LABEL org.label-schema.description = "A Ubuntu LTS Docker with R"
LABEL org.label-schema.vcs="https://github.com/orion434/R-Ubuntu-Docker"

LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.vcs-ref=$VCS_REF 
#LABEL org.label-schema.version = $BUILD_VERSION

# git ssh tar gzip ca-certificates are needed for circleci : https://circleci.com/docs/2.0/custom-images/#required-tools-for-primary-containers
# curl is needed for remote trigger the checks

RUN \
  apt-get update -qq && \
  apt-get install -y -qq --no-install-recommends \
  apt-utils \
  sudo \
  && \
  sudo apt-get upgrade -y -qq --no-install-recommends

RUN \  
  sudo apt-get update -qq && \
  sudo apt-get install -y -qq --no-install-recommends \
    ca-certificates \
    cmake \
    curl \
    git \ 
    gzip \
    libboost-all-dev \
    libgsl-dev \
    libnetcdf-c++4-dev \
    libnetcdf-dev \
    libssl-dev \
    libxml2-dev \
    netcdf-bin \
    ssh \
    subversion \
    sudo \
    tar  \
  && \  
  sudo apt-get autoremove -y && \
  sudo apt-get clean  \
  && rm -rf /var/lib/apt/lists/*
# Last lines delete temporary files and cache

RUN \
    sudo Rscript -e 'install.packages("devtools")' && \
    sudo Rscript -e 'update.packages(ask = FALSE)'

# Check if there are apt or r packages to be upgraded
#RUN \
    #apt2upg=$( sudo apt-get -s dist-upgrade | grep -Po "^[[:digit:]]+ (?=upgraded)" )  \
    #r2upg=$( sudo Rscript -e ' r_upg <-nrow( old.packages() ) ; if ( is.null(r_upg) ) { r_upg =0 }  ; cat(r_upg)'  ) \
    #printf "Pakages to be upgraded: \n apt: $apt2upg  \n r  : $r2upg \n"

# Define default command
CMD ["bash"]
