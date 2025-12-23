# login github
apt update
apt install gh
echo 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 | gh auth login --with-token
gh auth setup-git

# active conda
source /workspace/miniconda3/bin/activate
conda init bash

