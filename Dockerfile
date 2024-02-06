FROM ubuntu:20.04

# install deps
RUN apt-get update -y
RUN DEBIAN_FRONTEND=noninteractive TZ="America/New_York" apt-get install -y build-essential xutils-dev bison zlib1g-dev flex libglu1-mesa-dev doxygen make xutils bison flex python-pmw python-ply python-numpy libpng-dev python3-matplotlib graphviz git python-pmw python-ply python-numpy libxi-dev libxmu-dev wget iproute2 expect xutils-dev libc-dev libgl1-mesa-dev libglu1-mesa-dev freeglut3-dev libboost-dev libboost-system-dev libboost-filesystem-dev libboost-all-dev mpich nano git

# install cuda tools
RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
RUN mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
RUN wget http://developer.download.nvidia.com/compute/cuda/11.0.2/local_installers/cuda-repo-ubuntu2004-11-0-local_11.0.2-450.51.05-1_amd64.deb
RUN dpkg -i cuda-repo-ubuntu2004-11-0-local_11.0.2-450.51.05-1_amd64.deb
RUN apt-key add /var/cuda-repo-ubuntu2004-11-0-local/7fa2af80.pub

RUN apt-get update -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y cuda

ENV CUDA_INSTALL_PATH=/usr/local/cuda

# cleanup
RUN rm cuda-repo-ubuntu2004-11-0-local_11.0.2-450.51.05-1_amd64.deb

# fetch gpgpu-sim
WORKDIR /root
RUN git clone -b dev --single-branch https://github.com/gpgpu-sim/gpgpu-sim_distribution.git
