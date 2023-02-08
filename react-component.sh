#!/usr/local/homebrew/bin/bash
if [[ $# < 1 ]]; then
  echo "react-component: error: requires at least one argument"
  exit 1
fi

toCreate=()
for arg in "$@"; do
  strippedArg=$arg
  if [[ "$arg" == *.js ]]; then
    strippedArg=${arg::-3}
  fi 

  if [ -d "$arg" ] || [ -d "$strippedArg" ]; then
    echo "react-component: error: directory '$strippedArg' already exists"
    exit 1
  fi
  toCreate+=( $strippedArg )
done


for component in ${toCreate[@]}; do
  mkdir $component
  cd $component
  touch ${component}.js ${component}.module.css 'index.js'
  echo "export * from './$component.js'" > 'index.js'
  cd ../
done 
