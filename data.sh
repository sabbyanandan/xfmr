set -e -u

while :
do
	# generate random security-number
	RANDOM_SECURITY_NUMBER=$((RANDOM%100+200))-$((RANDOM%10+50))-$((RANDOM%1000+4000))
	
    # post it to cf
    curl -X POST "http://<ROUTE_OF_HTTP_SOURCE_APP_IN_CF>" -d "${RANDOM_SECURITY_NUMBER}" -H "Content-Type:text/plain" 
	
    # post it to k8s
    curl -X POST "http://<EXTERNAL_IP_OF_HTTP_SOURCE_APP_IN_K8S>:<PORT>" -d "${RANDOM_SECURITY_NUMBER}" -H "Content-Type:text/plain"
    
    echo "Sent: ${RANDOM_SECURITY_NUMBER}"
    
    # sleep
    sleep 1s
done