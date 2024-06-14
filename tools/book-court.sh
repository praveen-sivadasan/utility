#!/bin/sh

echo "Spruce Tennis Court Reservation"


# LOGIN=$(curl 'https://spruce.activebuilding.com/login' \
#   -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' \
#   -H 'Accept-Language: en-US,en;q=0.9,ca;q=0.8,fr;q=0.7,hi;q=0.6,zh-CN;q=0.5,zh;q=0.4,es;q=0.3,pt;q=0.2' \
#   -H 'Cache-Control: no-cache' \
#   -H 'Connection: keep-alive' \
#   -H 'Content-Type: application/x-www-form-urlencoded' \
#   -H 'Cookie: PHPSESSID=0l00bt7hc7osgeep6rcd3r75n1; TS01bdceb9=01c7a403d71fd63b2bebbc749512e700db2e4220304225d277caa5b5e5961379047628b2993e0b9a587e8fb795f7879970e6cbea30; rpTrackingExternalUserId=42e5d57b-fad2-4d74-8280-500e7103ff98; _ga=GA1.1.242075760.1718244912; __utma=258971720.242075760.1718244912.1718244912.1718244912.1; __utmc=258971720; __utmz=258971720.1718244912.1.1.utmcsr=null|utmccn=null|utmcmd=null|utmcct=null; __utmt_UA-20059076-3=1; AB_CURRENT_UNIT=829eab87-c6e2-4304-9651-05441a83a9fa; ahoy_visit=7f2dfb51-0499-4aa3-9789-965e2822ce53; ahoy_visitor=2665d9dc-6c2d-4d4c-912e-a52a89e6e755; OptanonConsent=isGpcEnabled=0&datestamp=Wed+Jun+12+2024+19%3A16%3A09+GMT-0700+(Pacific+Daylight+Time)&version=202402.1.0&browserGpcFlag=0&isIABGlobal=false&hosts=&consentId=50f282cc-c123-428d-a96e-26b6f912dcb1&interactionCount=1&isAnonUser=1&landingPath=https%3A%2F%2Fspruce.activebuilding.com%2Fportal%2Fresident-dashboard&groups=C0001%3A1%2CC0002%3A1%2CC0004%3A1; TS01ce050a=01c7a403d78f63e78221cc036b2d47e64e0a79d5654225d277caa5b5e5961379047628b299ede2f579717635884b1d8c9faae56eccdbca8f85ae9c3d91cdf324e869f74ebc6f35c404e206da783057d33b9882f1c6405119f905d362116a6bfc8c77e407ce; __utmb=258971720.3.10.1718244912; _ga_6TK834F1NE=GS1.1.1718244912.1.1.1718244974.0.0.0; rpTrackingFirstPartyUserObj=%7B%22id%22%3A%220721e848-d76e-46e4-99ad-c92446eac6bd%22%2C%22hit%22%3A5%7D' \
#   -H 'Origin: https://spruce.activebuilding.com' \
#   -H 'Pragma: no-cache' \
#   -H 'Referer: https://spruce.activebuilding.com/login' \
#   -H 'Sec-Fetch-Dest: document' \
#   -H 'Sec-Fetch-Mode: navigate' \
#   -H 'Sec-Fetch-Site: same-origin' \
#   -H 'Sec-Fetch-User: ?1' \
#   -H 'Upgrade-Insecure-Requests: 1' \
#   -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36' \
#   -H 'sec-ch-ua: "Google Chrome";v="125", "Chromium";v="125", "Not.A/Brand";v="24"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "macOS"' \
#   --data-raw 'username=sivadasan.praveen%40gmail.com')



echo "Login response from the server:"
# echo "$LOGIN"

current_date=$(date +"%m/%d/%Y")
formatted_date=$(echo "$current_date" | sed 's/\//%2F/g')

echo "Date: $formatted_date"

FORM_DATA_COURT1="amenityId=17376&startDate=$formatted_date&startTime=18%3A30&durationHours=1%3A00&approve-regulations=on&amenityYesnoQuestions%5B118996%5D=YES&amenityYesnoQuestions%5B118997%5D=YES"
FORM_DATA_COURT2="amenityId=22024&startDate=$formatted_date&startTime=18%3A30&durationHours=1%3A00&approve-regulations=on&amenityYesnoQuestions%5B118996%5D=YES&amenityYesnoQuestions%5B118997%5D=YES"
FORM_DATA_COURT3="amenityId=22025&startDate=$formatted_date&startTime=18%3A30&durationHours=1%3A00&approve-regulations=on&amenityYesnoQuestions%5B118996%5D=YES&amenityYesnoQuestions%5B118997%5D=YES"
FORM_DATA_COURT4="amenityId=22026&startDate=$formatted_date&startTime=18%3A30&durationHours=1%3A00&approve-regulations=on&amenityYesnoQuestions%5B118996%5D=YES&amenityYesnoQuestions%5B118997%5D=YES"

echo "Court: $FORM_DATA_COURT4"

# CREATEBOOKING=$(curl 'https://spruce.activebuilding.com/portal/reservations/create' \
#   -H 'Accept: application/json, text/plain, */*' \
#   -H 'Accept-Language: en-US,en;q=0.9,ca;q=0.8,fr;q=0.7,hi;q=0.6,zh-CN;q=0.5,zh;q=0.4,es;q=0.3,pt;q=0.2' \
#   -H 'Cache-Control: no-cache' \
#   -H 'Connection: keep-alive' \
#   -H 'Content-Type: application/x-www-form-urlencoded' \
#   -H 'Cookie: PHPSESSID=0l00bt7hc7osgeep6rcd3r75n1; rpTrackingExternalUserId=42e5d57b-fad2-4d74-8280-500e7103ff98; _ga=GA1.1.242075760.1718244912; __utmc=258971720; AB_CURRENT_UNIT=829eab87-c6e2-4304-9651-05441a83a9fa; ahoy_visit=7f2dfb51-0499-4aa3-9789-965e2822ce53; ahoy_visitor=2665d9dc-6c2d-4d4c-912e-a52a89e6e755; AB_V3API_Context=PTBuSXQ5Mll1Y21icFJHYnBWbllsWlhhME5XWXVrR2NoTmpkdncxTGNwemN3Ukhkb0ppT2l3bWNWMVNTUUZVTENGa0lzSVNNMmdqSTZJQ1JKMVNlMGxtYjExV2J2TlVMSkJWUXRJVVFpd2lJMklqSTZJQ1JKMVNldUZHY3Q5MlF0a0VVQjFpUUJKQ0xpSVRPM0VqTTNJak0zQXpNM1F6TnlRek0wWWpJNklpYmx0MmJVMXljelYyWWpGVUwwNVdkdk4yWUIxU1NRRlVMQ0ZrSXNJQ011QWpMd0lpT2k0MmJwTm5jbFpWTHlWV2IxTm5idk5VTEpCVlF0SVVRaXdpSTVrVE8wSWlPaVFVU3RJWFp0VjNjdTkyUXRrRVVCMWlRQkp5ZQ%3D%3D; TS01ce050a=01c7a403d7dfad5ed1ca1576b5aae9218b3823765a4225d277caa5b5e5961379047628b299ede2f579717635884b1d8c9faae56eccdbca8f85ae9c3d91cdf324e869f74ebc11565cf887025191dd362a4cea2ea6cc5259b34d194ca42681004acde0001b9c; OptanonAlertBoxClosed=2024-06-13T03:02:18.607Z; TS01bdceb9=01c7a403d7121aa5a5d8a385df4c23848e422b5330248e67cb918954b344a3a8335830a47dda7c83481238a5ab9d7d68d5e4dc6dc2; __utma=258971720.242075760.1718244912.1718244912.1718247745.2; __utmz=258971720.1718247745.2.2.utmcsr=null|utmccn=null|utmcmd=null|utmcct=null; __utmt_UA-20059076-3=1; __utmb=258971720.1.10.1718247745; rpTrackingFirstPartyUserObj=%7B%22id%22%3A%220721e848-d76e-46e4-99ad-c92446eac6bd%22%2C%22hit%22%3A9%7D; OptanonConsent=isGpcEnabled=0&datestamp=Wed+Jun+12+2024+20%3A02%3A56+GMT-0700+(Pacific+Daylight+Time)&version=202402.1.0&browserGpcFlag=0&isIABGlobal=false&hosts=&consentId=50f282cc-c123-428d-a96e-26b6f912dcb1&interactionCount=2&isAnonUser=1&landingPath=NotLandingPage&groups=C0001%3A1%2CC0002%3A1%2CC0004%3A1&geolocation=US%3BCA&AwaitingReconsent=false; _ga_6TK834F1NE=GS1.1.1718247739.2.1.1718247833.0.0.0' \
#   -H 'Origin: https://spruce.activebuilding.com' \
#   -H 'Pragma: no-cache' \
#   -H 'Referer: https://spruce.activebuilding.com/portal/reservations/step2' \
#   -H 'Sec-Fetch-Dest: empty' \
#   -H 'Sec-Fetch-Mode: cors' \
#   -H 'Sec-Fetch-Site: same-origin' \
#   -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36' \
#   -H 'X-NewRelic-ID: VwUDUlBRGwYDVlBaBwAAVA==' \
#   -H 'newrelic: eyJ2IjpbMCwxXSwiZCI6eyJ0eSI6IkJyb3dzZXIiLCJhYyI6IjMzNDM2MiIsImFwIjoiNjAxMzM2NzUyIiwiaWQiOiIzNDJmZjFlZTg0M2ZjNThlIiwidHIiOiJiYTFjNjc0ZTVhNTYxZjM4ZmM5ZjgyM2Y5MzIwMTNmMCIsInRpIjoxNzE4MjQ3ODQ2NjQ1LCJ0ayI6IjExMjc2OTMifX0=' \
#   -H 'sec-ch-ua: "Google Chrome";v="125", "Chromium";v="125", "Not.A/Brand";v="24"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "macOS"' \
#   -H 'traceparent: 00-ba1c674e5a561f38fc9f823f932013f0-342ff1ee843fc58e-01' \
#   -H 'tracestate: 1127693@nr=0-1-334362-601336752-342ff1ee843fc58e----1718247846645' \
#   --data-raw "$FORM_DATA_COURT1")

echo "Create booking response from the server:"
# echo "$CREATEBOOKING"
