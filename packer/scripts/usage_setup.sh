#!/usr/bin/env bash

BANNER_MSG="Jupyter VM for U18 Fest\n

jupyter-start = Start Jupyter server
jupyter-stop  = Stop Jupyter server
shutdown      = Shut down the VM

\S
Kernel \r on an \m"

echo -e "${BANNER_MSG}" | sudo tee /etc/issue     > /dev/null
echo -e "${BANNER_MSG}" | sudo tee /etc/issue.net > /dev/null

echo "alias shutdown='sudo shutdown -h 0'" >> ~/.bashrc
echo "alias jupyter-stop='~/miniconda/envs/u18fest_env/jupyter notebook stop 9000'" >> ~/.bashrc
echo "jupyter-start () {
cd ~/u18fest/notebooks
~/miniconda/envs/u18fest_env/jupyter notebook --port=9000 --no-browser --ip=0.0.0.0 &
}"  >> ~/.bashrc
