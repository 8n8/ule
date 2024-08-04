#!/bin/bash

set -e

stack build --fast

pushd test/helloWorld
./test.sh
popd

pushd test/dietvis
./test.sh
popd

pushd test/elm-spa-example
./test.sh
popd

pushd test/elm-shared-state
./test.sh
popd
