#!/bin/bash

set -e

PD=$(cd $(dirname $0);pwd)

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
      PROJECT="LineageOS 19.1"
     ;;
     lineage20 | -lo)
      PROJECT="LineageOS 20.0"
     ;;
     acme | -ae)
      PROJECT="AcmeUI"
     ;;
     arrow | -aw)
      PROJECT="ArrowOS"
     ;;
     dotos | -d)
      PROJECT="dotOS"
     ;;
     pe13 | -pe)
      PROJECT="pe13"
     ;;
     *)
      sleep 0.5
      echo "Unsupported project"
      echo "Please check spelling"
      exit
     ;;
esac

# GameSpace
if [ -d $PD/patches/$1/packages_apps_GameSpace ] && [ ! -d packages/apps/GameSpace ] ;then
git clone https://github.com/crdroidandroid/android_packages_apps_GameSpace -b 12.1 packages/apps/GameSpace
fi

echo "Adapt $PROJECT for $DEVICE"
echo "Executing in 5 seconds - CTRL-C to exit"
echo ""
sleep 5

echo "Applying patches"
apply_patch $PD $1
