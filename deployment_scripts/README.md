1. SSH into server as root (if no user with superuser privileges exists)

2. Create an account with superuser privileges if not yet existing:
```bash
adduser zeth

usermod -aG sudo zeth

su zeth
```

3. Enable firewall
```bash
ufw allow OpenSSH
ufw enable
```

4. Clone the code and start the deployment script! Ensure beforehand that the user account and the URL are still matching!
```bash
cd ~

git clone https://github.com/Zethson/lukas_heumos_website
```
Substitute the URL given in lukas_heumos_website/deployment_scripts/lukas_heumos_website with your domains.
Substitute the username in the lukas_heumos_website/deployment_scripts/lukas_heumos_website.service file.
You may need to substitute the port.
Rename the username given in the lukas_heumos_website/deployment_scripts/setup.sh script to match your home folder.
```bash
sudo bash lukas_heumos_website/deployment_scripts/setup.sh
```
