#!/bin/bash

set -ex

apt update

DEBIAN_FRONTEND=noninteractive apt install -y libguestfs-tools
