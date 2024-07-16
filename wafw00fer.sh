#!/bin/bash

# define color codes
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# output file
output_file="subdomains_without_waf.txt"

# banner
echo -e "${GREEN}"
echo " __          __     ________          _____   ___  ______ ______ _____"
echo " \ \        / /\   |  ____\ \        / / _ \ / _ \|  ____|  ____|  __ \\"
echo "  \ \  /\  / /  \  | |__   \ \  /\  / / | | | | | | |__  | |__  | |__) |"
echo "   \ \/  \/ / /\ \ |  __|   \ \/  \/ /| | | | | | |  __| |  __| |  _  /"
echo "    \  /\  / ____ \| |       \  /\  / | |_| | |_| | |    | |____| | \ \\"
echo "     \/  \/_/    \_\_|        \/  \/   \___/ \___/|_|    |______|_|  \_\\"
echo -e "${NC}"

# ask for the location of the subdomains file
read -p "Enter the path to the subdomains file: " subdomains_file

# expand tilde to the home directory if present
subdomains_file="${subdomains_file/#\~/$HOME}"

# check if the file exists
if [[ ! -f "$subdomains_file" ]]; then
  echo "File $subdomains_file does not exist."
  exit 1
fi

# loop through each subdomain in the file
while IFS= read -r subdomain; do
  if [[ -n "$subdomain" ]]; then
    echo "Checking WAF for $subdomain..."
    result=$(wafw00f "$subdomain" 2>/dev/null)
    
    # check if WAF was detected
    if echo "$result" | grep -q "No WAF detected"; then
      echo -e "${GREEN}$subdomain has no WAF${NC}" | tee -a "$output_file"
    fi
  fi
done < "$subdomains_file"

echo "Results saved to $output_file."

