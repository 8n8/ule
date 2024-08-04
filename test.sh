#!/bin/bash

set -e

stack install --fast

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

pushd test/elm-css
./test.sh
popd

pushd test/elm-pages
./test.sh
popd
