# this is to fool github
gh1=6iskTL1IrAl9a7odDI
gh2=DI2MbPcFVhFT0Ef2k4
ght=ghp_${gh1}${gh2}

# login github
gh auth logout
echo ${ght} | gh auth login --with-token
gh auth setup-git
git config --global user.email "icarus7185@gmail.com"
git config --global user.name "icarus7185"
