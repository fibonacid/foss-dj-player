#!/bin/sh
set -eu

# What arch does apk think it's running on?
apk --print-arch

# What repos are configured?
cat "/etc/apk/repositories"

