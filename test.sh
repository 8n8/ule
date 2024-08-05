#!/bin/bash

set -e

stack install --fast

GREEN='\033[1;32m'
NC='\033[0m'
RED='\033[1;31m'

function oneTest() {
    echo -n "$1 "
    pushd "test/$1" > /dev/null
    if ./test.sh > /dev/null; then
        echo -e "${GREEN}PASS${NC}"
    else
        echo -e "${RED}FAIL${NC}"
    fi
    popd > /dev/null
}

oneTest helloWorld
oneTest dietvis
oneTest elm-spa-example
oneTest elm-shared-state
oneTest elm-css
oneTest elm-pages
oneTest elm-review
oneTest elm-markdown
oneTest elm-csv
oneTest elm-syntax
oneTest missingCaseBranch
oneTest typeMismatch
oneTest unknownName
oneTest unknownImport
