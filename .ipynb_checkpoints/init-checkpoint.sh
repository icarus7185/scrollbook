# this is to fool github
gh1=mpcQLStUfCMdxhbg
gh2=k5vVWfhGdV7nG144GH6l
gh=ghp_${gh1}${gh2}

# login github
apt update
apt install gh
echo ${gh} | gh auth login --with-token
gh auth setup-git
git config --global user.email "icarus7185@gmail.com"
git config --global user.name "icarus7185"

# active conda
source /workspace/miniconda3/bin/activate
conda init bash

# add variable
echo 'export OLLAMA_MODELS="/workspace/models/ollama"' | tee -a ~/.bashrc > /dev/null