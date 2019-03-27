#!/bin/bash

set -exu

apt-get update
apt-get install -y python3 python3-pip python3-dev git curl

pip3 install jupyter
