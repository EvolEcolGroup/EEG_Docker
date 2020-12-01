# Pull base image
# To install, use the explicit LTS tag---currently 18.04---when pulling
# https://hub.docker.com/r/rocker/r-ubuntu
#FROM rocker/r-ubuntu:18.04 
FROM manicaeeg/eeg-docker:latest
# This docker is available at https://hub.docker.com/repository/docker/manicaeeg/eeg-docker


ARG BUILD_DATE
ARG VCS_REF
# ARG IMG_DIST
# ARG BUILD_VERSION

# Labels.
LABEL maintainer="Gian Luigi Somma"
LABEL org.label-schema.schema-version = "1.0"
LABEL org.label-schema.name = "eeg-mt-dna-combine"
LABEL org.label-schema.description = "A Ubuntu LTS Docker with R for mtDNAcombine project"
LABEL org.label-schema.vcs="https://github.com/EvolEcolGroup/EEG_Docker/mtDNAcombine"

LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.vcs-ref=$VCS_REF 
#LABEL org.label-schema.version = $BUILD_VERSION

RUN \
   apt-get install software-properties-common && \
   apt-get update -qq 

# Add required ppa address for updating the packages
RUN \
  add-apt-repository ppa:openjdk-r/ppa && \
  add-apt-repository ppa:ubuntugis/ppa && \
  add-apt-repository ppa:cran/imagemagick-dev && \
  apt-get update -qq     
  
# Install Java  
RUN \
  apt-get install -y -qq --no-install-recommends \
    default-jdk \
    default-jre

# Install required packages
RUN \
  apt-get install -y -qq --no-install-recommends \
    qpdf \
    libmagick++-dev \
    libudunits2-dev \
    libgdal-dev

RUN \
  sudo apt-get upgrade -y -qq --no-install-recommends && \
  sudo apt-get autoremove -y && \
  sudo apt-get clean  && \
  rm -rf /var/lib/apt/lists/*
# Last three lines delete temporary files and cache

RUN \
#    sudo Rscript -e 'install.packages("devtools")' && \
    sudo Rscript -e 'devtools::install_github("hadley/devtools")' && \
    sudo Rscript -e 'update.packages(ask = FALSE)' 
    

# Define default command.
CMD ["bash"]
