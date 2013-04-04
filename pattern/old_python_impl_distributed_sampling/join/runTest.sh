#!/bin/bash

echo "Sample $3 patterns..."
cat $1 | ./mapper.py $4 | ./reducer.py $4

echo "Done."

