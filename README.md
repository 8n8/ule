# Ule

A fork of the Elm compiler. The top priority is backwards compatibility with Elm 0.19.1.

## Build from source

This is the only way to install it.

1. install the Haskell tool stack: https://docs.haskellstack.org/en/stable/#how-to-install-stack
2. clone this repository and run `stack install` in the root of it - it will take a few minutes
3. add `export PATH=$HOME/.local/bin:$PATH` to your `.bashrc` or `.zshrc` file and restart your terminal
4. you should now be able to run `ule` exactly as you would run `elm`

## Run the tests

There is a basic snapshot test to check that Ule generates the same JS as Elm would for a hello world program.

The script to run it is: `./test.sh`.
