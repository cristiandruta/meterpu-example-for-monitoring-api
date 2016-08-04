# Example code for integration of MeterPU and monitoring-api

> Written in C++ and CUDA


## Summary

This module includes a minimal example to illustrate the usage of MeterPU to get power samples
and get visualized by ATOM monitoring frameworks. It interfaces with monitoring-api.

## Prerequisites

This example requires CUDA GPUs with energy counter, CUDA 7 or higher, CUDA TDK 5.319.85 or higher, and gcc 4.8.2 or higher.

Before you can proceed, please clone the repository:

```bash
git clone https://github.com/excess-project/monitoring-api-with-meterpu-example.git


### Dependencies

This project requires the following dependencies to be installed:

| Component         | Homepage                    | Version   |
|------------------ |---------------------------  |---------  |
| curl              | http://curl.haxx.se/        | >= 7.37   |


To ease the process of setting up a development environment, we provide a basic
script that downloads all dependencies, installs them locally in the project
directory, and then performs some clean-up operations. Thus, compiling the
monitoring API can be performed in a sandbox without affecting your current
operating system.

Executing the following script

```bash
./setup.sh
```

results in a new directory named `bin`, which holds the required dependencies
for compiling the project.


## Installation

This section assumes that you've successfully installed all required dependencies as described in the previous paragraphs.

```bash
$ make
$ make install
```


## Project Structure

The compiled monitoring API library is found in the folder `lib`. A simple example
of how to use the library is found in the `test` folder. The corresponding
binary is called `test_mf_api`.


## Acknowledgment

This project is realized through [EXCESS][excess]. EXCESS is funded by the EU 7th
Framework Programme (FP7/2013-2016) under grant agreement number 611183. We are
also collaborating with the European project [DreamCloud][dreamcloud].


## Contributing
Find a bug? Have a feature request?
Please [create](https://github.com/excess-project/monitoring-api/website/issues) an issue.


## Main Contributors

**Dennis Hoppe, HLRS**
+ [github/hopped](https://github.com/hopped)


## Release History

| Date        | Version | Comment          |
| ----------- | ------- | ---------------- |
| 2016-04-20  | 16.2    | Public release.  |


## License
Copyright (C) 2016 University of Stuttgart

[Apache License v2](LICENSE).

[server]: https://github.com/excess-project/monitoring-server
[excess]: http://www.excess-project.eu
[dreamcloud]: http://www.dreamcloud-project.eu
