#!/bin/sh

warn() {
	echo "$1" >&2
	rv=1
}

prg="${0##*/}"
rv=0

for arg in "$@"; do
	[ "$arg" = "-" ] && { envvars=true; continue; }
	if [ $envvars ]; then
		env | grep -q "^$arg=" ||
			warn "$prg: environment variable '$arg' not set"
	else
		command -v "$arg" > /dev/null ||
			warn "$prg: program '$arg' not installed"
	fi
done
exit $rv
