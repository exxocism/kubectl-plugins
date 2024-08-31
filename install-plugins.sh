#!/bin/zsh

# Move plugins and add location to path (required for kubectl 1.12+)
chmod +x ./kubectl-*
rm -rf ~/.kube/plugins/jordanwilson230
mkdir -p ~/.kube/plugins/jordanwilson230
cp -r ./kubectl-* ~/.kube/plugins/jordanwilson230/
grep 'PATH=$PATH:~/.kube/plugins/jordanwilson230' ~/.zprofile 1>/dev/null
[ $? -ne 0 ] && echo 'export PATH=$PATH:~/.kube/plugins/jordanwilson230' >>~/.zprofile

# Removes old installer function if exists
ex '+g/function kubectl()/d' -cwq ~/.zprofile >/dev/null 2>&1

# Finished
echo -e "\nDone.\nPlease open a new terminal or run: source ~/.zprofile\n"
kubectl plugin list --name-only | sed 's|-| |g'
