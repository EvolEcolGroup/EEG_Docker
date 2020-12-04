# Pull base image
# To install, use the explicit LTS tag---currently 18.04---when pulling
FROM rstudio/r-base:4.0-bionic 
# rstudio/r-base:x.y.z-distro, see https://github.com/rstudio/r-docker
# This docker is available at https://hub.docker.com/repository/docker/manicaeeg/eeg-docker

ARG BUILD_DATE 
ARG VCS_REF
# ARG IMG_DIST
# ARG BUILD_VERSION

# Labels
LABEL maintainer="Gian Luigi Somma" \
      org.label-schema.schema-version="1.1" \
      org.label-schema.name="EEG-Docker" \
      org.label-schema.description="A Ubuntu LTS Docker with R for EEG projects" \
      org.label-schema.vcs="https://github.com/EvolEcolGroup/EEG_Docker/" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-ref=$VCS_REF 
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
    doxygen \
    git \ 
    graphviz \
    gzip \
    libboost-all-dev \
    libgsl-dev \
    libnetcdf-c++4-dev \
    libnetcdf-dev \
    libssl-dev \
    libxml2-dev \
    netcdf-bin \
    pandoc \
    pandoc-citeproc \
    qpdf \
    ssh \
    subversion \
    sudo \
    tar  \
    valgrind \
    libudunits2-dev \
    libgdal-dev \
    libgeos-dev \
    libproj-dev \
  && \  
  sudo apt-get autoremove -y && \
  sudo apt-get clean  \
  && rm -rf /var/lib/apt/lists/*
# Last lines delete temporary files and cache

# Set the default repository for CRAN and install devtools
# The default is @CRAN@. It can be changed with:
# sudo Rscript -e 'r = getOption("repos"); r["CRAN"] = "https://cloud.r-project.org/" ; options(repos = r)' \
# or sudo Rscript -e "options(repos = 'https://cloud.r-project.org/')"
# but settings are not saved in different instances of the console.
RUN \
  sudo Rscript -e 'install.packages("devtools",repos = "https://cloud.r-project.org/")' ; \
  sudo Rscript -e 'install.packages("rmarkdown",repos = "https://cloud.r-project.org/")' ; \
  sudo Rscript -e 'update.packages(ask = FALSE,repos = "https://cloud.r-project.org/")'

# Check if there are apt or r packages to be upgraded
#RUN \
    #apt2upg=$( sudo apt-get -s dist-upgrade | grep -Po "^[[:digit:]]+ (?=upgraded)" )  \
    #r2upg=$( sudo Rscript -e ' r_upg <-nrow( old.packages() ) ; if ( is.null(r_upg) ) { r_upg =0 }  ; cat(r_upg)'  ) \
    #printf "Pakages to be upgraded: \n apt: $apt2upg  \n r  : $r2upg \n"

# Define default command
CMD ["bash"]
