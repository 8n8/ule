#!/bin/bash

set -e

stack build --fast

function debug_test() {
    pushd test/input/$1
    stack exec ule -- make src/Main.elm --output=elm.js
    popd

    diff "test/input/$1/elm.js" "test/expected/debug/$1.js"
}

function optimize_test() {
    pushd test/input/$1
    stack exec ule -- make src/Main.elm --optimize --output=elm.js
    popd

    diff "test/input/$1/elm.js" "test/expected/optimize/$1.js"
}

function snapshot_test() {
    rm -rf "test/input/$1/elm-stuff"

    debug_test "$1"
    optimize_test "$1"
}

snapshot_test helloWorld
snapshot_test elm-spa-example
