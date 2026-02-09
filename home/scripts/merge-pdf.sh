#!/bin/sh

usage() {
  echo "Usage: $0 -o <filename> [INPUTS]"
  echo
  echo "Arguments:"
  echo "  [INPUTS]       List of PDF files to merge"
  echo "Options:"
  echo "  -o <filename>  Filename of the output PDF"
  exit 1
}

# Parse flags with getopts
while getopts "o:" opt; do
  case $opt in
    o) outfile="$OPTARG" ;;       # Capture name argument
    \?) echo "Error: Unknown flag -$OPTARG" >&2; usage ;;  # Unknown flag
    :) echo "Error: Flag -$OPTARG requires an argument" >&2; usage ;;  # Missing argument
  esac
done

# Validate required flags
if [ -z "$outfile" ]; then
  echo "Error: -o is a required flag" >&2
  usage
fi

gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile="$outfile" "$@"