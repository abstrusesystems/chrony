#!/bin/sh

# exit on error
set -e

echo ${DATA}

# initialize data directory
init_data() {
	# create root directory
	mkdir -p ${DATA}
	
	# if not directory /etc then create
	if [[ ! -d ${DATA}/etc ]];
	then
		mv /etc/bind ${DATA}/etc
	fi
	
	# delete old location
	rm -rf /etc/bind
	
	# link old location to new directory
	ln -sf ${DATA}/etc /etc/bind


	# if not directory /var then create
	if [[ ! -d ${DATA}/var ]];
	then
		mv /var/bind ${DATA}/var
	fi
	
	# delete old location
	rm -rf /var/bind
	
	# link old location to new directory
	ln -sf ${DATA}/var /var/bind
}

init_data

# run CMD
exec "$@"

