# WAFW00FER

WAFW00FER is a simple bash script designed to check for the presence of Web Application Firewalls (WAFs) on a list of subdomains. It utilizes the `wafw00f` tool to perform the detection. The script prints a custom ASCII art banner at the start and prompts the user to provide the path to a file containing a list of subdomains.

## Features

- Custom ASCII art banner.
- Detects and reports subdomains with no detected WAF.
- Simple and easy to use.

## Usage

1. Ensure `wafw00f` is installed (`sudo apt-get install wafw00f` on Debian-based systems).
2. Make the script executable (`chmod +x check_waf.sh`).
3. Run the script (`./check_waf.sh`) and provide the path to your `subdomains.txt` file.
4. The script will check each subdomain for the presence of a WAF and report subdomains without a detected WAF.
