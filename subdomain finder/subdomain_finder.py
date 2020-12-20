# Download a subdomain file and put it in the same folder as this script

import requests

domain = "CHANGE THIS"

# CHANGE IT FOR YOUR OWN SUBDOMAIN'S WORDLIST, like - https://github.com/assetnote/commonspeak2-wordlists/blob/master/subdomains/subdomains.txt
file = open("subdomains.txt", "r")

content = file.read()
subdomains = content.splitlines()

for subdomain in subdomains:
    url = f"http://{subdomain}.{domain}"
    try:
        requests.get(url)
    except requests.ConnectionError:
        pass
    else:
        print("We found out this subdomain:", url)
