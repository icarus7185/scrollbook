# add variable
echo 'export OLLAMA_MODELS="/workspace/models/ollama"' | tee -a ~/.bashrc > /dev/null
source ~/. bashrc

# active conda
source /workspace/miniconda3/bin/activate
conda init bash
