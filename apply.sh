#!/bin/bash

set -e

PD=$PWD/patches

apply_patch() {
patches="$(readlink -f -- $1)"
tree="$2"

for project in $(cd $patches/patches/$tree; echo *);do
	p="$(tr _ / <<<$project |sed -e 's;platform/;;g')"
	pushd $p
	for patch in $patches/patches/$tree/$project/*.patch;do
		git am $patch || exit
	done
	popd
done
}

DEVICE="Cezanne" 

case $1 in
     kosp | -k)
      PROJECT="AOSP-Krypton"
     ;;
     pe | -p)
      PROJECT="Pixel-Experience"
     ;;
     lineage | -l)
      PROJECT="LineageOS"
     ;;
     acme | -ae)
      PROJECT="AcmeUI"
     ;;
     arrow | -aw)
      PROJECH="ArrowOS"
     ;;
     dotos | -d)
      PROJECH="dotOS"
     ;;
esac

# GameSpace
if [ -d $PD/$1/packages_apps_GameSpace ] || [ ! -d packages/apps/GameSpace ] ;then
git clone https://github.com/crdroidandroid/android_packages_apps_GameSpace -b 12.1 packages/apps/GameSpace
fi

echo "Adapt $PROJECT for $DEVICE"
echo "Executing in 5 seconds - CTRL-C to exit"
echo ""
sleep 5

echo "Applying patches"
apply_patch $PD $1
