#!/bin/bash
set -euo pipefail

rm -rf btrack/libs
mkdir -p btrack/{libs,obj}

make CXX="${CXX}" \
  CXXFLAGS="${CXXFLAGS} -std=c++14 -fPIC -I./btrack/include -DDEBUG=false -DBUILD_SHARED_LIB" \
  LDFLAGS="${LDFLAGS} -shared" XLDFLAGS=""

${PYTHON} -m pip install . --no-deps --no-build-isolation -vv
