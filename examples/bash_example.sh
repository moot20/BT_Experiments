#!/bin/bash

sudo perf stat -e power/energy-pkg/ -e power/energy-psys/ /usr/bin/time -v $INTERPRETER $FILEPATH