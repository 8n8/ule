#!/bin/bash

set -e

stack build --fast

function snapshot_test() {
    rm -rf "test/input/$1/elm-stuff"

    pushd test/input/$1
    stack exec ule -- make src/Main.elm --output=elm.js
    popd

    diff "test/input/$1/elm.js" "test/expected/$1.js"
}

snapshot_test helloWorld
snapshot_test elm-spa-example
