#!/bin/bash

function show_help() {
  echo -e "\nYou can run a variety of Eulith examples from this script. Here are the options:\n"
  echo "  -e               |  ERC20 handling"
  echo "  -k               |  KMS"
  echo "  -s               |  Swap"
  echo "  -t <TO_ADDRESS>  |  Simple Transfer"
  echo "  -c               |  Transfer from toolkit contract"
  echo -e "\nIf you would like to examine the code for the examples, have a look at the files in the examples folder.\n"
}

function run_simple_transfer() {
  python examples/simple_transfer.py "$1"
}

if [ $# -eq 0 ]; then
    show_help
    exit 1
fi

source venv/bin/activate

while getopts "h?ekst:c" opt; do
  case "$opt" in
    h|\?)
      show_help
      exit 0
      ;;
    e) python examples/erc20_handling.py
      ;;
    k) python examples/kms_signer.py
      ;;
    s) python examples/swap.py
      ;;
    t) run_simple_transfer $OPTARG
      ;;
    c) python examples/transfer_from_toolkit.py
      ;;
  esac
done