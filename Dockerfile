# Use the official Debian base image
FROM debian:bullseye

RUN mkdir inventories

COPY inventories/ inventories/

# Update the package list and install essential tools
RUN apt-get update && apt-get install -y \
    vim \
    software-properties-common

# Install Python 3.9 from the deadsnakes PPA
# RUN add-apt-repository ppa:deadsnakes/ppa &&
RUN apt-get update && apt-get install -y python3.9

# Set up a symlink to make 'python3' command use Python 3.9
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1

# Cleanup
RUN apt-get clean


# Default command when running a container from this image
CMD ["/bin/bash"]

