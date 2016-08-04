#!/bin/bash
#  Copyright (C) 2016 University of Stuttgart
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#


#set up monitoring api
set_up_monitoring_api()
{
	git clone https://github.com/excess-project/monitoring-api.git
	cd monitoring-api
	./setup.sh
	cd -
}

#set up Nvidia GDK
set_up_nvidia_gdk()
{
	GDK_PATH="./nvidia_gdk"
	mkdir -p $GDK_PATH
	cd $GDK_PATH
	NVIDIA_BASE_URL="http://developer.download.nvidia.com"
	NVIDIA_GDK="gdk_linux_amd64_352_55_release.run"
	wget ${NVIDIA_BASE_URL}/compute/cuda/7.5/Prod/gdk/${NVIDIA_GDK}
	if [ ! -f ${NVIDIA_GDK} ]; then
		echo "[ERROR] File not found: " ${NVIDIA_GDK}
		exit 1;
	fi
	chmod +x ${NVIDIA_GDK}
	./${NVIDIA_GDK} --silent --installdir=`realpath .`
}


set_up_monitoring_api
set_up_nvidia_gdk
