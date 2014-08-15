#!/bin/sh
# File:            eVY1
# Description:     Script to start the Squeak VM binary with the scratch image
# Original Author: Bert Freudenberg
# Adapted by:      Miriam Ruiz
# Adapted by:      Kazuhiro Abe

VM_VERSION=`find /usr/lib/squeak/ -name "squeakvm" -type f|cut -f5 -d"/"`
SQ_DIR=/usr/lib/squeak/$VM_VERSION
VM="$SQ_DIR/squeakvm"
test -z "${DISPLAY%:*}" && XSHM="-xshm"
VMOPTIONS="-encoding UTF-8 -vm-display-x11 $XSHM -plugins /usr/lib/scratch/plugins/:$SQ_DIR/ -compositioninput"
IMAGE="/home/pi/eVY1RasPi/eVY1RasPi140815.image"
IMOPTIONS=""
DOCUMENT=""
WRAPPER=""

#set to 1 to work around OLPC bug #8008
export SQUEAK_FAKEBIGCURSOR=0

# default directories (used if not running as Sugar activity)
[ -z "$SQUEAK_SECUREDIR" ] && export SQUEAK_SECUREDIR="$HOME/.scratch/private"
[ -z "$SQUEAK_USERDIR" ] && export SQUEAK_USERDIR="$HOME/Scratch"

[ ! -d "$SQUEAK_SECUREDIR" ] && mkdir -p "$SQUEAK_SECUREDIR" && chmod 700 "$SQUEAK_SECUREDIR"
[ ! -d "$SQUEAK_USERDIR" ] && mkdir -p "$SQUEAK_USERDIR"

[ ! -d "$HOME/Documents" ] && mkdir -p "$HOME/Documents"

usage()
{
    echo "Usage: scratch [--param value] [-vmopt value] [arg value]"
    echo "       where --param is --vm, --image, or --document;"
    echo "       -vmopt is an option passed to the Squeak VM;"
    echo "       and args are passed to the Squeak image."
}

if [ $# -eq 1 ] ; then
	case "$1" in
	    /*) DOCUMENT="$1"
		;;
	    *) DOCUMENT="$PWD/$1"
		;;
	esac
	shift
else
    while [ -n "$1" ] ; do
	if [ -z "$2" ] ; then
	        usage
		exit -1
	fi
	case "$1" in
	        --help)
			usage
 			exit
			;;
	        --document)
			case "$2" in
			    /*) DOCUMENT="$2"
				;;
			    *) DOCUMENT="$PWD/$2"
				;;
			esac
 			shift
			;;
	        --image)
			case "$2" in
			    /*) IMAGE="$2"
				;;
			    *) IMAGE="$PWD/$2"
				;;
			esac
 			shift
			;;
	        --vm)
			case "$2" in
			    /*) VM="$2"
				;;
			    *) VM="$PWD/$2"
				;;
			esac
 			shift
			;;
		-*) VMOPTIONS="$VMOPTIONS $1 $2"
			shift
			;;
		*)  IMOPTIONS="$IMOPTIONS $1 $2"
			shift
			;;
	esac
	shift
    done
fi

# do not crash on dbus errors
export DBUS_FATAL_WARNINGS=0

# make Compose input methods work
# 30/01/2013: apprently this causes issues, so comment out. asb@asbradbury.org
#[ -z "$LC_ALL" ] && export LC_ALL="$LANG"

VMOPTIONS="$VMOPTIONS -vm-sound-alsa"

# VM, Image, and Document are non-optional
# Document has to be present even if empty for IMOPTIONS to work
echo Executing: $WRAPPER "$VM" $VMOPTIONS "$IMAGE" "$DOCUMENT" $IMOPTIONS
exec $WRAPPER "$VM" $VMOPTIONS "$IMAGE" "$DOCUMENT" $IMOPTIONS
