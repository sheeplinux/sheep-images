# Sheep images

[![Build Status](https://api.travis-ci.org/sheeplinux/sheep-images.svg?branch=master)](https://travis-ci.org/sheeplinux/sheep-images)

Images build for Sheep.

At this point, it basically takes Qcow2 official images from vendors and repackages the root filesystem as a tar.gz
archive. Extracting a Qcow2 is somehow long, so using tar.gz archives instead, helps to speed up the process.
