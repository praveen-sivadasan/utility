#!/bin/bash

echo "Spruce Tennis Court Reservation"
echo "Current time: $(date)"


LOGIN_1=$(curl -c login1-cookie.txt 'https://spruce.activebuilding.com/login' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7');

LOGIN_2=$(curl -L -b login1-cookie.txt -c login2-cookie.txt 'https://spruce.activebuilding.com/login' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,
  application/signed-exchange;v=b3;q=0.7' \
  --data-raw 'username=sivadasan.praveen%40gmail.com')

AUTHORIZE=$(curl -L -b login2-cookie.txt 'https://account.activebuilding.com/authorize' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' \
  --data-raw 'username=sivadasan.praveen%40gmail.com&password=hwh*fyj2YBD3nqj3jhp&remember=&client_id=a51763fb-a96c-4d5d-97b1-938e2267df00&scope=all&authRequest=def502004c78963617cf687f093c3c4919ea7acf4186e7514b52da0d83520d9e9d6fe46e37c4752903cbe17ad61606206dbb555631f208f6fd0c03f7c330d3369e1ec15efa38d52f42ed8e40b2ccdc44d4ac412dd49c9818eaad45a28ace2f4b0759c34504b56337dc5f5fadc3fe5aab6c7d3035f44a6c870784eceb4560c18dc4aa433d772193bbb079a1384b10401bc8e48f933e1ed90de2a231959066f8474fd297f2efd80bd9dadab6942420db7bdc8b557a66fd100215d3da5d9bdfbf8acd3afa5e72e3ab301ab4ad45f1cd63fcc26fc500ffdd75a255fa362218bf8748c03588867dd58e0db9c9d01587e71e966997ba30204a19854c838db0dc42b908d806103ed57d105c159bc27de058c419892d715dce4bb497e61487add3f0c35842e58b04909d6976c95f7cfc01dd740103f3f90d493618105d0a80181d50f0c0eb92fac3dde6c3f348db790612efd064838af85401d9ce2bd57ac30b2432753e5bbb707d1d02729cab939459223e7854d05d57bce020cd884c4431d67daf70214fb0102a1fe5a2cdfd2502868f92d8e66a363d5538e9a27cb1d9f930f8fe37a943caced35a33252a9612666f640044bff96266de7cd5a6ddadd97974ac30e7cc01519aa5733f05417f74fe29cb40e68064b47a38fbd78bc8ecac692cf39e83d3a46f8b7fed32dcb5fa92a793e3899d4ad65743a7730660e2f977a48785815fe41e8e698d3a6deb6fec054be4ade705ac51a353eb2be0883fdf59a806a0f7cdf6a108a84afb4bb489db04b76d08440f05cf6da0fe4ba4227db04c6f05beaac9d5d121c93ee32c3754f38eda314f8511bcfc148c921d2673c518407a4f6104ea1575b3a51edf3204883678f2ee74da8e4e37e09accc3c5cf35f4413b6e98ac8763007dff234057acb36e495b50a382ab213a04b8a86a0cab709aaedd006b6879284dbcd850f32668bd84e38667ec6264fecaffe89884522b96b57bc519f5c2d5b7479c7270008dc71601dff97e2a5309bb86e8a0362552000c5bd9b8e7228054693b2376a7501721c1a4ca2c944cac068ae3cfddac46823ee7984fa3f3d5e6b8360c4f8553f63139975ebbf85162f1e74ab175d9d7fc7f0bd83464715bb1e4ce3b83e83082a864699e0d94f4c6ef0163f46a161c748976232f91e76bc80437a62059c8d56733ebb77522a56d2483da3527704ef957d5c4215c6cd6520373ad8afe525c27c543a160f6a2ac6b91afe0f623ed33ce1f8adb1ade1e319a170b89613165ef2c371a05e79232052109c3e14465447aaa0716bf779739ef9f57cac99dab82f5e6adc17e75666df368ee517108c9f2b2d307a1555220a87cb640813b21158d8adfef5c3c77953396115baf04f1579acc2dc137dd4f0d2377f23d8604a3f2418be45823352021518c5226f438352fb256dfcf03725f0f0a43f4470daabb41d3adb0b41dc4ba08559729153f9ae856b16738dc61d08a5d540a17100dbc6ad396059cb410f52313c4e2ee4804d8a24d531c3183fb4bcee1e0aa0404ff907ff3b5c9b5ca2dee5e80f5586830b336c1077bb558682ede73486fd064d9&authorize=Sign+In+and+Authorize&cancel=')

# Extract the first occurrence of PHPSESSID
phpsessid=$(grep -m 1 'PHPSESSID' "login2-cookie.txt" | awk '{print $7}')

echo
# Print the extracted PHPSESSID
echo "First PHPSESSID: $phpsessid"

echo

date_plus_5=$(date -d "+5 days" +"%m/%d/%Y")
formatted_date=$(echo "$date_plus_5" | sed 's/\//%2F/g')

echo "Date: $formatted_date"
echo

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

  echo
  echo "Current time: $(date)"
  echo

  local curl_command="curl 'https://spruce.activebuilding.com/portal/reservations/create' \
  -H 'Accept: application/json, text/plain , */*' \
  -H 'Cookie: PHPSESSID=$phpsessid;' \
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
  
  execute_curl $court $court_id
  if [ $? -eq 0 ]; then
     echo "Booking done for $court"
     break
  else
     echo "Booking failed for $court, trying another court..."
  fi
  echo 
done