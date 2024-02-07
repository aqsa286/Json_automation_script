#!/bin/bash
file=$1
# Prompt the user to input the replacement word for "title1"
echo -n "Enter the replacement word for 'title' with 1st alphabet capital: "
read -r title_replacement
echo -n "Enter the replacement word for 'request_uri': "
read -r request_uri_replacement
echo -n "Enter the replacement word for 'index-pattern': "
read -r index_replacement
mapfile -t client_urls < url_file
for ((i=0; i<${#client_urls[@]}; i++)); do
    if grep -q "domain$((i+1))" "$file"; then
        sed -i "s/domain$((i+1))/${client_urls[i]}/g" "$file"
    else
        echo "Error: 'domain$((i+1))' not found in $file."
    fi
done
sed -i "s/title1/$title_replacement/g" "$file"
sed -i "s/req_uri/$request_uri_replacement/g" "$file"
sed -i "s/index1/$index_replacement/g" "$file"
echo "Replacements complete in $file."
