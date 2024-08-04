#!/bin/bash

set -e

stack build --fast

function debug_test() {
    pushd "test/input/$1" > /dev/null
    stack exec ule -- make src/Main.elm --output=elm.js > /dev/null
    popd > /dev/null

    diff "test/input/$1/elm.js" "test/expected/debug/$1.js"
}

function optimize_test() {
    pushd "test/input/$1" > /dev/null
    stack exec ule -- make src/Main.elm --optimize --output=elm.js > /dev/null
    popd > /dev/null

    diff "test/input/$1/elm.js" "test/expected/optimize/$1.js"
}

function snapshot_test() {
    echo "Testing $1"
    rm -rf "test/input/$1/elm-stuff"

    debug_test "$1"
    optimize_test "$1"
}

pushd test/helloWorld
./test.sh
popd

pushd test/dietvis
./test.sh
popd

snapshot_test elm-spa-example
snapshot_test elm-shared-state
