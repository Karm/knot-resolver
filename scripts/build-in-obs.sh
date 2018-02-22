#!/bin/bash -e

# Example usage:
# 1. place tarball to be released in git root dir
# 2. scripts/make-distrofiles.sh
# 3. scripts/build-in-obs.sh knot-resolver-latest

project=home:CZ-NIC:$1
package=knot-resolver

osc co "${project}" "${package}"
pushd "${project}/${package}"
osc del * ||:
cp ../../*.tar.xz ./
cp -rL ../../distro/fedora/* ./
cp -rL ../../distro/arch/* ./
cp ../../distro/debian/*.debian.tar.xz ./
cp "../../distro/debian/${package}.dsc" ./
osc addremove
osc ci -n
popd
