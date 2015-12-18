; working with static libcurl
InitNetwork()
IncludeFile "libcurl.pbi"

curl = curl_easy_init()
url.s = str2curl("http://deseven.info/test.php")
agent.s = str2curl("pbcurl/1.0")
cookie.s = str2curl("var=value;")
post.s = str2curl("login=mylogin&password=mypassword")
header.s = str2curl("Cache-Control: no-cache")
If curl
  curl_easy_setopt(curl,#CURLOPT_URL,@url)
  curl_easy_setopt(curl,#CURLOPT_IPRESOLVE,#CURL_IPRESOLVE_V4)
  curl_easy_setopt(curl,#CURLOPT_COOKIE,@cookie)
  curl_easy_setopt(curl,#CURLOPT_POSTFIELDS,@post)
  curl_easy_setopt(curl,#CURLOPT_USERAGENT,@agent)
  curl_easy_setopt(curl,#CURLOPT_TIMEOUT,30)
  *header = curl_slist_append(0,header)
  curl_easy_setopt(curl,#CURLOPT_HTTPHEADER,*header)
  curl_easy_setopt(curl,#CURLOPT_WRITEFUNCTION,@curlWriteData())
  res = curl_easy_perform(curl)
  resData.s = curlGetData()
  curl_easy_getinfo(curl,#CURLINFO_RESPONSE_CODE,@resHTTP)
  Debug "result: " + Str(res)
  If Not res
    Debug "HTTP code: " + Str(resHTTP)
    Debug "HTTP data: " + #CRLF$ + resData
  EndIf
  curl_easy_cleanup(curl)
Else
  Debug "can't init curl!"
EndIf
; IDE Options = PureBasic 5.40 LTS (Windows - x86)
; EnableUnicode
; EnableXP