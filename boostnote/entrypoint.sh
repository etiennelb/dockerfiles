#!/bin/bash
set -e
set -o pipefail

COMMAND=/usr/bin/boostnote

if [ -z ${NEWUSER+x} ]; then
	echo "WARN: No user was defined, defaulting to root."
	echo "WARN: Boostnote will save files as root:root."
	echo "      To prevent this, start the container with -e NEWUSER=\$USER"
	exec "$COMMAND"
else
	# The root user already exists, so we only need to do something if
	# a user has been specified.
	useradd -s /bin/bash -m "$NEWUSER" -u "$USERID" -U
	su "$NEWUSER" -c "$COMMAND"
fi