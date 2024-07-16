# WAFW00FER

WAFW00FER is a simple bash script designed to check for the presence of Web Application Firewalls (WAFs) on a list of subdomains. It utilizes the `wafw00f` tool to perform the detection.

## Features

- Detects and reports subdomains with no WAF.
- Simple and easy to use.

## Usage

1. Ensure `wafw00f` is already installed (`sudo apt install wafw00f` on Debian-based systems).
2. git clone the repo using this command (`git clone https://github.com/atharvak95/wafw00fer.git`) .
3. Make the script executable (`chmod +x check_waf.sh`)
4. Run the script (`./check_waf.sh`) and provide the path to your `subdomains.txt` file.
5. The script will check each subdomain for the presence of a WAF and report subdomains without a detected WAF.

<img src="![image](https://github.com/user-attachments/assets/42580b11-de8f-4076-916b-f6e34bbba8f2)
" alt="image" width="500" height="300">
