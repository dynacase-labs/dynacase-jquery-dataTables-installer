#!/usr/bin/env bash

rm -rf ./bower_components/
bower install "DataTables"
PACKAGE_VERSION=$(bower info DataTables version | tail -n 1 | cut -d "'" -f 2)
cd ./bower_components
mkdir ./jquery-dataTables
mv ./datatables/media/ ./jquery-dataTables/1.10/
zip -r "../datatables-$PACKAGE_VERSION.zip" ./jquery-dataTables/1.10/
cd ..
scp "datatables-$PACKAGE_VERSION.zip" distrib@ftp.anakeen.com:/share/ftp/third-party/
echo $PACKAGE_VERSION > VERSION