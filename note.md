# Conda
- download conda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

- run conda installer
bash Miniconda3-latest-Linux-x86_64.sh -u -b -p /workspace/miniconda3

- init conda
source /workspace/miniconda3/bin/activate
conda init bash  
conda init --all

- modify default env folder
conda config --add envs_dirs /workspace/condaenv

- create new env
conda create -n ograg python==3.8

- change python version
conda install python=3.10

- register to use conda env at jupyter notebook
conda install ipykernel
python -m ipykernel install --user --name=diffusion --display-name="Conda-diffusion"

python -m ipykernel install --user --name=ollama --display-name="Conda-ollama"
python -m ipykernel install --user --name=ograg --display-name="Conda-ograg"
python -m ipykernel install --user --name=rag --display-name="Conda-rag"

- conda and pip
try conda install first
if conda fail, try pip install <package_name> --no-deps  (mean no dependency)

conda list
conda remove <name>


# Linux bash
- copy folder
cp -r /workspace/condaenv/* /workspace/miniconda3/envs/
- delete folder
rm -rf /workspace/temp/*

uvicorn webapp:app --host 0.0.0.0 --port 5000
ps aux | grep "uvicorn"
kill -SIGTERM <PID_of_uvicorn_process>
kill -9 <PID_number>
pkill -9 -f uvicorn


# LLama note
conda create -n llm python==3.10    # working version
pip install llama-stack==0.2        # working version
llama model download --source meta --model-id Llama3.3-70B


## git
apt update
apt install gh
echo <key> | gh auth login --with-token
git clone https://github.com/YangLing0818/RPG-DiffusionMaster
git reset HEAD^     # caution !!

5. requirements
- create and active conda environment
conda create -n RPG python==3.9
conda activate RPG
cd /workspace/RPG-DiffusionMaster
pip install -r requirements.txt

## huggingface login

from huggingface_hub import login
import os
login(token="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")


--------------------

cd /workspace
bash Miniconda3-latest-Linux-x86_64.sh -u -b -p /workspace/miniconda3
source /workspace/miniconda3/bin/activate
conda init bash
conda config --add envs_dirs /workspace/condaenv

conda activate diff
pip install fastapi uvicorn

cd /workspace/RPG-DiffusionMaster


python /workspace/transformers/src/transformers/models/llama/convert_llama_weights_to_hf.py \
    --input_dir /workspace/llm/Llama3.2-3B \
    --model_size 3B \
    --output_dir /workspace/llm/HF-Llama3.2-3B

python /workspace/transformers/src/transformers/models/llama/convert_llama_weights_to_hf.py \
    --input_dir /workspace/llm/Llama3.2-3B \
    --model_size 3B \
    --llama_version 3.2 \
    --output_dir /workspace/llm/HF-Llama3.2-3B

7z a -mx=9 /workspace/rpg_nhom_8_source.7z /workspace/RPG-DiffusionMaster
7z a -mx=9 /workspace/rpg_nhom_8_env.7z /workspace/miniconda3/envs/diff

--------------
## Ollama
curl -fsSL https://ollama.com/install.sh | sh
ollama pull llama3.2:1b
ollama pull mxbai-embed-large
ollama serve
