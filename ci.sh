#!/bin/bash
cd $(dirname $0)

set -e

cd semeru_jsf_maven
sudo rm -rf build
mvn clean
sudo rm -rf target