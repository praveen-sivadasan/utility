#!/bin/bash

echo "Spruce Tennis Court Reservation"
echo "Current time: $(date)"

LOGIN=$(curl -L -v /tmp/cookies.txt 'https://spruce.activebuilding.com/login' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,
  application/signed-exchange;v=b3;q=0.7' \
  -H 'Cookie: PHPSESSID=qvdmonv1ih90ubtkpiu3c66ej7;' \
  --data-raw 'username=sivadasan.praveen%40gmail.com')


echo "Login response from the server:"
echo "$LOGIN"

date_plus_5=$(date -d "+5 days" +"%m/%d/%Y")
formatted_date=$(echo "$date_plus_5" | sed 's/\//%2F/g')

echo "Date: $formatted_date"

## Method 1

# FORM_DATA_COURT4="amenityId=22026&startDate=$formatted_date&startTime=18%3A30&durationHours=1%3A00&approve-regulations=on&amenityYesnoQuestions%5B118996%5D=YES&amenityYesnoQuestions%5B118997%5D=YES"

# echo "Court: $FORM_DATA_COURT4"
# CREATEBOOKING=$(curl 'https://spruce.activebuilding.com/portal/reservations/create' \
#   -H 'Accept: application/json, text/plain, */*' \
#     -H 'Cookie: PHPSESSID=0l00bt7hc7osgeep6rcd3r75n1; rpTrackingExternalUserId=42e5d57b-fad2-4d74-8280-500e7103ff98; _ga=GA1.1.242075760.1718244912; __utmc=258971720; AB_CURRENT_UNIT=829eab87-c6e2-4304-9651-05441a83a9fa; ahoy_visit=7f2dfb51-0499-4aa3-9789-965e2822ce53; ahoy_visitor=2665d9dc-6c2d-4d4c-912e-a52a89e6e755; AB_V3API_Context=PTBuSXQ5Mll1Y21icFJHYnBWbllsWlhhME5XWXVrR2NoTmpkdncxTGNwemN3Ukhkb0ppT2l3bWNWMVNTUUZVTENGa0lzSVNNMmdqSTZJQ1JKMVNlMGxtYjExV2J2TlVMSkJWUXRJVVFpd2lJMklqSTZJQ1JKMVNldUZHY3Q5MlF0a0VVQjFpUUJKQ0xpSVRPM0VqTTNJak0zQXpNM1F6TnlRek0wWWpJNklpYmx0MmJVMXljelYyWWpGVUwwNVdkdk4yWUIxU1NRRlVMQ0ZrSXNJQ011QWpMd0lpT2k0MmJwTm5jbFpWTHlWV2IxTm5idk5VTEpCVlF0SVVRaXdpSTVrVE8wSWlPaVFVU3RJWFp0VjNjdTkyUXRrRVVCMWlRQkp5ZQ%3D%3D; TS01ce050a=01c7a403d7dfad5ed1ca1576b5aae9218b3823765a4225d277caa5b5e5961379047628b299ede2f579717635884b1d8c9faae56eccdbca8f85ae9c3d91cdf324e869f74ebc11565cf887025191dd362a4cea2ea6cc5259b34d194ca42681004acde0001b9c; OptanonAlertBoxClosed=2024-06-13T03:02:18.607Z; TS01bdceb9=01c7a403d7121aa5a5d8a385df4c23848e422b5330248e67cb918954b344a3a8335830a47dda7c83481238a5ab9d7d68d5e4dc6dc2; __utma=258971720.242075760.1718244912.1718244912.1718247745.2; __utmz=258971720.1718247745.2.2.utmcsr=null|utmccn=null|utmcmd=null|utmcct=null; __utmt_UA-20059076-3=1; __utmb=258971720.1.10.1718247745; rpTrackingFirstPartyUserObj=%7B%22id%22%3A%220721e848-d76e-46e4-99ad-c92446eac6bd%22%2C%22hit%22%3A9%7D; OptanonConsent=isGpcEnabled=0&datestamp=Wed+Jun+12+2024+20%3A02%3A56+GMT-0700+(Pacific+Daylight+Time)&version=202402.1.0&browserGpcFlag=0&isIABGlobal=false&hosts=&consentId=50f282cc-c123-428d-a96e-26b6f912dcb1&interactionCount=2&isAnonUser=1&landingPath=NotLandingPage&groups=C0001%3A1%2CC0002%3A1%2CC0004%3A1&geolocation=US%3BCA&AwaitingReconsent=false; _ga_6TK834F1NE=GS1.1.1718247739.2.1.1718247833.0.0.0' \
#   -H 'Origin: https://spruce.activebuilding.com' \
#   --data-raw "$FORM_DATA_COURT4")
# echo "Create booking response from the server:"
# echo "$CREATEBOOKING"

## Method 2

declare -A court_id_pairs
courts=("court4" "court1" "court2" "court3")
court_ids=("22026" "17376" "22024" "22025")

execute_curl() {
  local key=$1
  local value=$2
  local formatted_date=$3

  local curl_command="curl 'https://spruce.activebuilding.com/portal/reservations/create' \
  -H 'Accept: application/json, text/plain , */*' \
  -H 'Cookie: PHPSESSID=qvdmonv1ih90ubtkpiu3c66ej7;' \
  -H 'Origin: https://spruce.activebuilding.com' \
  --data-raw 'amenityId=$value&startDate=$formatted_date&startTime=18%3A30&durationHours=1%3A00&approve-regulations=on&amenityYesnoQuestions%5B118996%5D=YES&amenityYesnoQuestions%5B118997%5D=YES'"
  
  # Print the curl command (for debugging purposes)
  echo "Running command: $curl_command"
  
  # Execute the curl command and capture the response
  local response=$(eval $curl_command)
  echo "Response: $response"
  
  # Check for curl errors
  if [ $? -ne 0 ]; then
    return 1
  fi

  # Check for empty response
  if [ -z "$response" ]; then
    return 1
  fi

  # is reponse has success false
  if ! command -v jq >/dev/null || ! jq -e '.success' <<< "$response" >/dev/null || \
    [ "$(jq -r '.success' <<< "$response")" == "false" ]; then
    return 1
  fi

  # If none of the above conditions matched, consider it successful
  return 0

}

#Loop to execute the curl command with each key-value pair
for (( i=0; i<${#courts[@]}; i++ ))
do
  court=${courts[i]}
  court_id=${court_ids[i]}
  
  execute_curl $court $court_id $formatted_date
  if [ $? -eq 0 ]; then
     echo "Booking done for $court"
     break
  else
     echo "Booking failed for $court, trying another court..."
  fi
  echo 
done