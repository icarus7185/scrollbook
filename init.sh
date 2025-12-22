# login github
apt update
apt install gh
echo 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 | gh auth login --with-token

# active conda
source /workspace/miniconda3/bin/activate
conda init bash

