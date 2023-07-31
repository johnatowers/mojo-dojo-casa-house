# mojo-dojo-casa-house
azure/prometheus/grafana/ubiquiti

The goal of this repo is to create a simple Azure network that can communicate with my house, to run a docker container that runs UniFi UnPoller, and collects my network info and displays it via a grafa dashboard.

I will have terraform that creates the virtual machine in Azure.
I will have chef that will configure the VM with docker, prometheus, and grafana, and any other config
I will have files that pull the docker image, and begin running it.