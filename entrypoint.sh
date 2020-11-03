#!/bin/sh

# exit on error
set -e

# initialize data directory
init_data() {
	# create root directory
	mkdir -p ${DATA}
	
	# if not directory /etc then create
	if [[ ! -d ${DATA}/etc ]];
	then
#		mv /etc/chrony ${DATA}/etc
	fi
	
	# delete old location
#	rm -rf /etc/chrony
	
	# link old location to new directory
#	ln -sf ${DATA}/etc /etc/chrony


	# if not directory /var then create
	if [[ ! -d ${DATA}/var ]];
	then
#		mv /var/lib/chrony ${DATA}/var
	fi
	
	# delete old location
#	rm -rf /var/lib/chrony
	
	# link old location to new directory
#	ln -sf ${DATA}/var /var/lib/chrony
}

init_data

#check for chrony configuration in default location
if [[ ! -f ${DATA}/etc/chrony.conf ]]
then
	echo "Please place your chrony configuration in ${DATA}/etc/chrony.conf"
fi

# run CMD
echo "Running '$@'"
exec "$@"
