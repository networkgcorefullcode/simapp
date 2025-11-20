<!--
Copyright 2021-present Open Networking Foundation
SPDX-License-Identifier: Apache-2.0
-->
[![Go Report Card](https://goreportcard.com/badge/github.com/omec-project/simapp)](https://goreportcard.com/report/github.com/omec-project/simapp)

# Simapp
## Sim subscription app for Aether

## Repository Structure

Below is a high-level view of the repository and its main components:
```
.
├── config                      # Contains configuration files for the Simapp service, such as runtime parameters and behavior definitions (simapp.yaml).
│   └── simapp.yaml
├── Dockerfile
├── Dockerfile.fast
├── go.mod
├── go.mod.license
├── go.sum
├── go.sum.license
├── LICENSES
│   └── Apache-2.0.txt
├── logger                      # Provides the logging setup and configuration used across the application.
│   └── logger.go
├── Makefile                    # Provides commands for building, testing, and cleaning up the project.
├── README.md
├── simapp.go                   # Main entry point of the Simapp service. Initializes the simulator, loads configuration, and starts execution.
├── Taskfile.yml                # Provides commands for building, testing, and cleaning up the project.
├── test-mirror.txt
├── VERSION
└── VERSION.license

4 directories, 16 files
```


## Configuration and Deployment

**Docker**

To build the container image:
```
task mod-start
task build
task docker-build-fast
```

**Kubernetes**

The standard deployment uses Helm charts from the Aether project. The version of the Chart can be found in the OnRamp repository in the `vars/main.yml` file.


## Quick Navigation

| Type             | File / Directory                                                      | Description                                         |
| ---------------- | --------------------------------------------------------------------- | --------------------------------------------------- |
| Core          | [`simapp.go`](./simapp.go)                                            | Main source file for launching the Simapp service.  |
| Configuration | [`config/simapp.yaml`](./config/simapp.yaml)                          | Defines simulation behavior and runtime parameters. |
| Logging       | [`logger/logger.go`](./logger/logger.go)                              | Centralized logging configuration.                  |
| Container     | [`Dockerfile`](./Dockerfile) / [`Dockerfile.fast`](./Dockerfile.fast) | Standard and optimized Docker build definitions.    |
| Build Tools   | [`Makefile`](./Makefile) / [`Taskfile.yml`](./Taskfile.yml)           | Build and automation scripts.                       |
| Dependencies  | [`go.mod`](./go.mod) / [`go.sum`](./go.sum)                           | Go module definitions and dependency checksums.     |
| License       | [`LICENSES/Apache-2.0.txt`](./LICENSES/Apache-2.0.txt)                | License file for open-source compliance.            |
| Version       | [`VERSION`](./VERSION)                                                | Specifies the component version.                    |
| Documentation | [`README.md`](./README.md)                                            | Repository-level documentation and usage notes.     |




### Subscriber Configuration
- SIMApp can configure devices in 5G as well as in 4G.
- look for config/simapp.yaml file for all override options
- Update subscriber range for your usecase
- Make sure sub-provison-endpt points to webui (5g configpod service) or
config4g (4G configpod service)
- In case sub-proxy is running in the deployment then sub-proxy-endpt should
point to sub-proxy (ROC Component). Also port needs to be changed accordingly

### Optionaly simapp can be used to configure network slices in the 4G/5G network functions as well
- Update device-groups, network-slices as per your need
- provision-network-slice should be set to true if you need simapp to configure
slices as well
- In case ROC is running in the deployment then network slices can be configured
from ROC

## Reach out to us thorugh
1. #sdcore-dev channel in [ONF Community Slack](https://onf-community.slack.com/)
2. Extensive SD-Core documentation can be found at [SD-Core Documentation](https://docs.sd-core.opennetworking.org/main/index.html)
3. Raise Github issues
