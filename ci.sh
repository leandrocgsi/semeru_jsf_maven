#!/bin/bash
cd $(dirname $0)

set -e

./semeru_jsf_maven clean build
sudo rm -rf build
mvn clean
sudo rm -rf target