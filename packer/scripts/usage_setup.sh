#!/usr/bin/env bash

BANNER_MSG="Jupyter VM for U18 Fest\n
\n
jupyter-start = Start Jupyter server
jupyter-stop  = Stop Jupyter server
shutdown      = Shut down the VM

\S
Kernel \r on an \m"

sudo echo -e '${BANNER_MSG}' > /etc/issue
sudo echo -e '${BANNER_MSG}' > /etc/issue.net

echo "alias shutdown='sudo shutdown -h 0'" >> ~/.bashrc
echo "alias jupyter-stop='jupyter notebook stop 9000'" >> ~/.bashrc
echo "alias jupyter-start='
source ~/miniconda/bin/activate root
conda activate u18fest_env
cd ~/u18fest/notebooks
jupyter notebook --port=9000 --no-browser --ip=0.0.0.0'" >> ~/.bashrc
