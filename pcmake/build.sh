#!/bin/sh

local_path=$(dirname $(readlink -f $0))

build_dir=$local_path'/build'
src_dir=$local_path'/src'

if [ ! -d $src_dir ]; then
    echo "Source directory don\'t exist: " $src_dir
fi

if [ ! -d $build_dir ]; then
    echo "Create build directory: " $build_dir
    mkdir -p $build_dir
fi

pushd $build_dir > /dev/null
cmake ..
make
popd > /dev/null
