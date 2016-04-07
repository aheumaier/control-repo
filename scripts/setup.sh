#!/bin/bash

BUNDLER=`which bundle`
R10K=`which r10k`
PUPPET=`which puppet`


if [ -n $BUNDLER ]; then
	`${BUNDLER} install`
else
	echo 'Error bundler gem not installed'
	exit 1
fi

if [ -n $R10K ]; then
	`${R10K} puppetfile install`
else
	echo 'Error r10k gem  not installed'
	exit 1
fi

if [ -n $PUPPET ]; then
	`FACTER_puppet_role=webserver ${PUPPET} apply --debug --noop --modulemanifests/site.pp`
else
	echo 'Error puppet not installed'
	exit 1
fi
