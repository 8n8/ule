#!/bin/bash

ule make src/Main.elm &> got.txt
diff expected.txt got.txt
