# login github
apt update
apt install gh
echo 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 | gh auth login --with-token
gh auth setup-git

# active conda
source /workspace/miniconda3/bin/activate
conda init bash

