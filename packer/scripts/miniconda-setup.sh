#!/usr/bin/env bash

sudo yum install -y git wget gcc-c++ emacs
sudo yum update -y
sudo yum clean all
git clone https://github.com/dbarajassolano/u18fest.git

# Miniconda
mkdir -p ~/.conda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
bash ~/miniconda.sh -b -p $HOME/miniconda

# Set up the environment
~/miniconda/bin/conda create -n u18fest_env numpy=1.15.* gxx_linux-64 pymc3 jupyter

# Configure Jupyter
~/miniconda/envs/u18fest_env/bin/jupyter notebook --generate-config
echo "c.NotebookApp.token = ''" >> ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.password = ''" >> ~/.jupyter/jupyter_notebook_config.py

# Wrap up
BANNER_MSG="**************************************************\n
Jupyter VM for U18 Fest

Your login is u18fest and your password is u18fest 

jupyter-start = Start Jupyter server
jupyter-stop  = Stop Jupyter server
shutdown      = Shut down the VM

**************************************************\n"

echo -e "${BANNER_MSG}" | sudo tee /etc/issue     > /dev/null
echo -e "${BANNER_MSG}" | sudo tee /etc/issue.net > /dev/null

echo "alias shutdown='sudo shutdown -h 0'" >> ~/.bashrc
echo "alias jupyter='~/miniconda/envs/u18fest_env/bin/jupyter'" >> ~/.bashrc
echo "alias jupyter-stop='~/miniconda/envs/u18fest_env/bin/jupyter notebook stop 9000'" >> ~/.bashrc
echo "jupyter-start () {
cd ~/u18fest/notebooks
~/miniconda/envs/u18fest_env/bin/jupyter notebook --port=9000 --no-browser --ip=0.0.0.0 &
echo -e '\n'
echo -e	'	**************************************************'
echo -e '	** Direct your browser to http://localhost:9000 **'
echo -e '	**************************************************'
echo -e '\n'
}"  >> ~/.bashrc
echo "git-update {
git reset --hard
git pull
}" >> ~/.bashrc

sync
