# gpgpu-sim-docker
gpgpu-sim in a docker image (Ubuntu 20.04, CUDA Toolkit 11)

### Build

```bash
$ docker build -t gpgpu-sim:latest .
```

### Run

Use the container:

```bash
$ docker run -w /root -it gpgpu-sim /bin/bash
```

From the shell in the container, run:
```bash
$ cd gpgpu-sim_distribution
$ source setup_environment
$ make clean
$ make
```

It should now be compiled, and CUDA applications can now be compiled and run.
