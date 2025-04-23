#!/bin/sh

PARAM=${1:-all}

export TRUENAS_VERSION=25.04.0
export TRUENAS_TRAIN="TrueNAS-SCALE-Fangtooth-Custom"
export SKIP_SOURCE_REPO_VALIDATION=1

case "$PARAM" in
    release)
        make checkout
        PACKAGES=kernel PARALLEL_BUILDS=1 make packages
        PACKAGES=kernel-dbg PARALLEL_BUILDS=1 make packages
        make
    ;;
    all)
        make
    ;;
    checkout)
        make checkout
    ;;
    check_upstream_package_updates)
        make check_upstream_package_updates
    ;;
    packages)
        make packages
    ;;
    update)
        make update
    ;;
    iso)
        make iso
    ;;
    clean)
        make clean
    ;;
    *)
        echo >&2 "Invalid option: $PARAM"
        exit 1
    ;;
esac
