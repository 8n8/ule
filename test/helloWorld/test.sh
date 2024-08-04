#!/bin/bash

set -e

rm -rf elm-stuff

stack exec ule -- make src/Main.elm --output=got_debug.js
diff expected_debug.js got_debug.js

stack exec ule -- make src/Main.elm --optimize --output=got_optimize.js
diff expected_optimize.js got_optimize.js
