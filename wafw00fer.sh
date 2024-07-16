#!/bin/bash

# Define color codes
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Banner
echo -e "${GREEN}"
echo " __          __     ________          _____   ___  ______ ______ _____"
echo " \ \        / /\   |  ____\ \        / / _ \ / _ \|  ____|  ____|  __ \\"
echo "  \ \  /\  / /  \  | |__   \ \  /\  / / | | | | | | |__  | |__  | |__) |"
echo "   \ \/  \/ / /\ \ |  __|   \ \/  \/ /| | | | | | |  __| |  __| |  _  /"
echo "    \  /\  / ____ \| |       \  /\  / | |_| | |_| | |    | |____| | \ \\"
echo "     \/  \/_/    \_\_|        \/  \/   \___/ \___/|_|    |______|_|  \_\\"
echo -e "${NC}"

# Print author information in yellow
echo -e "${YELLOW}Author: atharvak95 (GitHub)${NC}"

# Prompt the user for the location of the subdomains file
read -p "Enter the path to the subdomains file: " subdomains_file

# Expand tilde to the home directory if present
subdomains_file="${subdomains_file/#\~/$HOME}"

# Check if the file exists
if [[ ! -f "$subdomains_file" ]]; then
  echo "File $subdomains_file does not exist."
  exit 1
fi

# Loop through each subdomain in the file
while IFS= read -r subdomain; do
  if [[ -n "$subdomain" ]]; then
    echo "Checking WAF for $subdomain..."
    result=$(wafw00f "$subdomain" 2>/dev/null)
    
    # Check if WAF was detected
    if echo "$result" | grep -q "No WAF detected"; then
      echo -e "${GREEN}$subdomain has no WAF${NC}"
    fi
  fi
done < "$subdomains_file"
