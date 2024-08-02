#!/bin/bash

set -e

stack build --fast

rm -rf test/input/helloWorld/elm-stuff

pushd test/input/helloWorld
stack exec ule -- make src/Main.elm --output=elm.js
popd

diff test/input/helloWorld/elm.js test/expected/helloWorld.js
