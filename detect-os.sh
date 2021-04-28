#!/usr/bin/env bash

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "Hello Linux ---:)";
elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "MacOS";
elif [[ "$OSTYPE" == "cygwin" ]]; then
        echo "POSIX compatibility layer and Linux environment emulation for Windows";
elif [[ "$OSTYPE" == "msys" ]]; then
        echo "Lightweight shell and GNU utilities compiled for Windows (part of MinGW)";
elif [[ "$OSTYPE" == "win32" ]]; then
        echo "I'm not sure this can happen.";
elif [[ "$OSTYPE" == "freebsd"* ]]; then
        echo "FreeBSD";
else
        echo "Unknown";
fi
