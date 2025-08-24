echo "Nginx Log Analyser"

if [-z "$1"]; then
    INPUT_FILE_DIR="/var/log/nginx/access.log"
else
    INPUT_FILE_DIR=$1
fi

echo -e "\n     Top 5 IP addresses with the most requests:\n"
awk '{print $1}' $INPUT_FILE_DIR | sort | uniq -c | sort -nr | awk '{print $2" - "$1" requests"}' | head -n 5

echo -e "\n     Top 5 most requested paths:\n"
awk '{print $7}' $INPUT_FILE_DIR | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2" - "$1" requests"}'

echo -e "\n     Top 5 response status codes:\n"
awk '{print $9}' $INPUT_FILE_DIR | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2" - "$1" requests"}'

echo -e "\n     Top 5 user agents\n"
awk '{print $12}' $INPUT_FILE_DIR | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2" - "$1" requests"}'
