set -e

echo "Dist Root: ${DIST_ROOT:?}"
echo "LFS: ${LFS:?}"

if ! test $(whoami) == "tester" ; then
    echo "Must run as tester!"
    exit -1
fi
