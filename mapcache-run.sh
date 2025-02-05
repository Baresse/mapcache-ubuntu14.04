#!/bin/sh

url=$1
cache=$2

if [ $# -eq 0 ]
  then

    echo 'ERROR : no arguments supplied'
    echo 'mapcache-run --wms \"wms url\" --prj \"folder name for cache\"'

  else
    if [ -z "$1" ] || [ -z "$2" ]
      then

        echo 'ERROR : argument(s) could not be empty'
        echo 'mapcache-run --wms \"wms url\" --prj \"folder name for cache\"'

      else

        # generate mapcache.xml from capabilities
        python mapcache.py --wms $url --prj $cache

        # Create temp directory for mapcache tiles
        mkdir /tmp/$cache
        chmod 777 /tmp/$cache

        # restart apache and mapcache module
        apachectl restart

    fi
fi
