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

![image](https://github.com/user-attachments/assets/b9c9ae7e-eee1-4a64-aabf-1b1a42a37f6f)
