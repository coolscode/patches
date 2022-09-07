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

if [ $1 = kosp ] ;then
PROJECT="AOSP-Krypton"
elif [ $1 = pe  ] ;then
PROJECT="Pixel-Experience"
elif [ $1 = lineage  ] ;then
PROJECT="LineageOS"
elif [ $1 = acme  ] ;then
PROJECT="AcmeUI"
elif [ $1 = arrow  ] ;then
PROJECH="ArrowOS"
elif [ -d $PD/$1/packages_apps_GameSpace ] || [ ! -d packages/apps/GameSpace ] ;then
git clone https://github.com/crdroidandroid/android_packages_apps_GameSpace -b 12.1 packages/apps/GameSpace
fi

echo "Adapt $PROJECT for $DEVICE"
echo "Executing in 5 seconds - CTRL-C to exit"
echo ""
sleep 5

echo "Applying patches"
apply_patch $PD $1
