#!/usr/bin/env sh

set -e -u

[[ -d $PWD/maven && ! -d $HOME/.m2 ]] && ln -s $PWD/maven $HOME/.m2

# set distribution directory
repository=$(pwd)/distribution-repository

cd xfmr

# build the project
./mvnw deploy -DaltDeploymentRepository=distribution::default::file://${repository}

# move the jar and application dockerfile to a dedicated output directory
cp src/main/docker/Dockerfile target/xfmr-*.jar ../docker-image

# find the project version
THE_VERSION=$(grep -o '<revision[^"]*' pom.xml | sed -e 's/<revision>\(.*\)<\/revision>/\1/')

# THE_VERSION=$(find ${repository} -name "*.jar" | xargs basename | sed 's|xfmr-\(.*\)\.jar|\1|') <- OLD HACK

# move the extracted version also to the dedicated output directory
echo "THE_VERSION is -> $THE_VERSION"
echo $THE_VERSION > ../docker-image/projectVersion