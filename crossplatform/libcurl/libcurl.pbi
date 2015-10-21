Enumeration 0
  #CURLE_OK
  #CURLE_UNSUPPORTED_PROTOCOL    ; 1 
  #CURLE_FAILED_INIT             ; 2 
  #CURLE_URL_MALFORMAT           ; 3 
  #CURLE_URL_MALFORMAT_USER      ; 4 (Not USED) 
  #CURLE_COULDNT_RESOLVE_PROXY   ; 5 
  #CURLE_COULDNT_RESOLVE_HOST    ; 6 
  #CURLE_COULDNT_CONNECT         ; 7 
  #CURLE_FTP_WEIRD_SERVER_REPLY  ; 8 
  #CURLE_FTP_ACCESS_DENIED       ; 9 a service was denied by the FTP server due To lack of access - when login fails this is Not returned. 
  #CURLE_FTP_USER_PASSWORD_INCORRECT ; 10 
  #CURLE_FTP_WEIRD_PASS_REPLY        ; 11 
  #CURLE_FTP_WEIRD_USER_REPLY        ; 12 
  #CURLE_FTP_WEIRD_PASV_REPLY        ; 13 
  #CURLE_FTP_WEIRD_227_FORMAT        ; 14 
  #CURLE_FTP_CANT_GET_HOST           ; 15 
  #CURLE_FTP_CANT_RECONNECT          ; 16 
  #CURLE_FTP_COULDNT_SET_BINARY      ; 17 
  #CURLE_PARTIAL_FILE                ; 18 
  #CURLE_FTP_COULDNT_RETR_FILE       ; 19 
  #CURLE_FTP_WRITE_ERROR             ; 20 
  #CURLE_FTP_QUOTE_ERROR             ; 21 
  #CURLE_HTTP_RETURNED_ERROR         ; 22 
  #CURLE_WRITE_ERROR                 ; 23 
  #CURLE_MALFORMAT_USER              ; 24 - Not USED 
  #CURLE_FTP_COULDNT_STOR_FILE       ; 25 - failed FTP upload 
  #CURLE_READ_ERROR                  ; 26 - could open/Read from file 
  #CURLE_OUT_OF_MEMORY               ; 27 
  #CURLE_OPERATION_TIMEOUTED         ; 28 - the timeout time was reached 
  #CURLE_FTP_COULDNT_SET_ASCII       ; 29 - TYPE A failed 
  #CURLE_FTP_PORT_FAILED             ; 30 - FTP PORT operation failed 
  #CURLE_FTP_COULDNT_USE_REST        ; 31 - the REST command failed 
  #CURLE_FTP_COULDNT_GET_SIZE        ; 32 - the SIZE command failed 
  #CURLE_HTTP_RANGE_ERROR            ; 33 - RANGE "command" didn't work 
  #CURLE_HTTP_POST_ERROR             ; 34 
  #CURLE_SSL_CONNECT_ERROR           ; 35 - wrong when connecting With SSL 
  #CURLE_BAD_DOWNLOAD_RESUME         ; 36 - couldn't resume download 
  #CURLE_FILE_COULDNT_READ_FILE      ; 37 
  #CURLE_LDAP_CANNOT_BIND            ; 38 
  #CURLE_LDAP_SEARCH_FAILED          ; 39 
  #CURLE_LIBRARY_NOT_FOUND           ; 40 
  #CURLE_FUNCTION_NOT_FOUND          ; 41 
  #CURLE_ABORTED_BY_CALLBACK         ; 42 
  #CURLE_BAD_FUNCTION_ARGUMENT       ; 43 
  #CURLE_BAD_CALLING_ORDER           ; 44 - Not USED 
  #CURLE_INTERFACE_FAILED            ; 45 - CURLOPT_INTERFACE failed 
  #CURLE_BAD_PASSWORD_ENTERED        ; 46 - Not USED 
  #CURLE_TOO_MANY_REDIRECTS          ; 47 - catch endless re-direct loops 
  #CURLE_UNKNOWN_TELNET_OPTION       ; 48 - User specified an unknown option 
  #CURLE_TELNET_OPTION_SYNTAX        ; 49 - Malformed telnet option 
  #CURLE_OBSOLETE                    ; 50 - Not USED 
  #CURLE_SSL_PEER_CERTIFICATE        ; 51 - peer's certificate wasn't ok 
  #CURLE_GOT_NOTHING                 ; 52 - when this is a specific error 
  #CURLE_SSL_ENGINE_NOTFOUND         ; 53 - SSL crypto engine Not found 
  #CURLE_SSL_ENGINE_SETFAILED        ; 54 - can Not set SSL crypto engine As Default 
  #CURLE_SEND_ERROR                  ; 55 - failed sending network Data 
  #CURLE_RECV_ERROR                  ; 56 - failure in receiving network Data 
  #CURLE_SHARE_IN_USE                ; 57 - share is in use 
  #CURLE_SSL_CERTPROBLEM             ; 58 - problem With the local certificate 
  #CURLE_SSL_CIPHER                  ; 59 - couldn't use specified cipher 
  #CURLE_SSL_CACERT                  ; 60 - problem With the CA cert (path?) 
  #CURLE_BAD_CONTENT_ENCODING        ; 61 - Unrecognized transfer encoding 
  #CURLE_LDAP_INVALID_URL            ; 62 - Invalid LDAP URL 
  #CURLE_FILESIZE_EXCEEDED           ; 63 - Maximum file size exceeded 
  #CURLE_FTP_SSL_FAILED              ; 64 - Requested FTP SSL level failed 
  #CURLE_SEND_FAIL_REWIND            ; 65 - Sending the Data requires a rewind that failed 
  #CURLE_SSL_ENGINE_INITFAILED       ; 66 - failed To initialise ENGINE 
  #CURLE_LOGIN_DENIED                ; 67 - user password Or similar was Not accepted And we failed To login 
  #CURLE_TFTP_NOTFOUND               ; 68 - file Not found on server 
  #CURLE_TFTP_PERM                   ; 69 - permission problem on server 
  #CURLE_TFTP_DISKFULL               ; 70 - out of disk space on server 
  #CURLE_TFTP_ILLEGAL                ; 71 - Illegal TFTP operation 
  #CURLE_TFTP_UNKNOWNID              ; 72 - Unknown transfer ID 
  #CURLE_TFTP_EXISTS                 ; 73 - File already exists 
  #CURLE_TFTP_NOSUCHUSER             ; 74 - No such user 
  #CURL_LAST                         ; never use! 
EndEnumeration
Enumeration 0 ; curlsocktype
  #CURLSOCKTYPE_IPCXN  ; socket created For a specific IP connection 
  #CURLSOCKTYPE_LAST   ; never use
EndEnumeration
Enumeration   ; curlioerr
  #CURLIOE_OK ; I/O operation successful 
  #CURLIOE_UNKNOWNCMD     ; command was unknown To callback 
  #CURLIOE_FAILRESTART    ; failed To restart the Read 
  #CURLIOE_LAST           ; never use 
EndEnumeration
Enumeration   ; curliocmd
  #CURLIOCMD_NOP          ; no operation 
  #CURLIOCMD_RESTARTREAD  ; restart the Read stream from start 
  #CURLIOCMD_LAST         ; never use 
EndEnumeration
Enumeration 0 ; curl_infotype
              ; the kind of Data that is passed To information_callback
  #CURLINFO_TEXT
  #CURLINFO_HEADER_IN    ; 1 
  #CURLINFO_HEADER_OUT   ; 2 
  #CURLINFO_DATA_IN      ; 3 
  #CURLINFO_DATA_OUT     ; 4 
  #CURLINFO_SSL_DATA_IN  ; 5 
  #CURLINFO_SSL_DATA_OUT ; 6 
  #CURLINFO_END
EndEnumeration
Enumeration   ; curl_proxytype
  #CURLPROXY_HTTP   = 0
  #CURLPROXY_SOCKS4 = 4
  #CURLPROXY_SOCKS5 = 5
EndEnumeration
Enumeration ; curl_usessl
            ; parameter For the CURLOPT_USE_SSL option 
  #CURLUSESSL_NONE      ;  do Not attempt To use SSL 
  #CURLUSESSL_TRY       ;  try using SSL proceed anyway otherwise 
  #CURLUSESSL_CONTROL   ;  SSL For the control connection Or fail 
  #CURLUSESSL_ALL       ;  SSL For all communication Or fail 
  #CURLUSESSL_LAST      ;  Not an option never use 
EndEnumeration          ;
Enumeration             ; curl_ftpccc
                        ; parameter For the CURLOPT_FTP_SSL_CCC option 
  #CURLFTPSSL_CCC_NONE  ;  do Not send CCC 
  #CURLFTPSSL_CCC_PASSIVE   ;  Let the server initiate the shutdown 
  #CURLFTPSSL_CCC_ACTIVE    ;  Initiate the shutdown 
  #CURLFTPSSL_CCC_LAST      ;  Not an option never use 
EndEnumeration
Enumeration ; curl_ftpauth
            ; parameter For the CURLOPT_FTPSSLAUTH option 
  #CURLFTPAUTH_DEFAULT  ;  let libcurl decide 
  #CURLFTPAUTH_SSL      ;  use "AUTH SSL" 
  #CURLFTPAUTH_TLS      ;  use "AUTH TLS" 
  #CURLFTPAUTH_LAST     ;  Not an option never use 
EndEnumeration
Enumeration ; curl_ftpmethod
            ; parameter For the CURLOPT_FTP_FILEMETHOD option 
  #CURLFTPMETHOD_DEFAULT   ;  let libcurl pick 
  #CURLFTPMETHOD_MULTICWD  ;  single CWD operation For each path part 
  #CURLFTPMETHOD_NOCWD     ;  no CWD at all 
  #CURLFTPMETHOD_SINGLECWD ;  one CWD To full dir then work on file 
  #CURLFTPMETHOD_LAST      ;  Not an option never use 
EndEnumeration
Enumeration ; curl_http
            ; These enums are For use With the CURLOPT_HTTP_VERSION option. 
  #CURL_HTTP_VERSION_NONE ; setting this means we don't care and that we'd
                          ; like the library To choose the best possible
                          ; For us! 
  #CURL_HTTP_VERSION_1_0  ; please use HTTP 1.0 in the request 
  #CURL_HTTP_VERSION_1_1  ; please use HTTP 1.1 in the request 
  #CURL_HTTP_VERSION_LAST ;  *ILLEGAL* http version 
EndEnumeration
Enumeration ; curl_NETRC_OPTION
            ; These enums are For use With the CURLOPT_NETRC option. 
  #CURL_NETRC_IGNORED     ; The .netrc will never be Read.
                          ;   This is the Default. 
  #CURL_NETRC_OPTIONAL    ; A user:password in the URL will be preferred
                          ;   To one in the .netrc. 
  #CURL_NETRC_REQUIRED    ; A user:password in the URL will be ignored.
                          ;   Unless one is set programmatically the .netrc
                          ;   will be queried. 
  #CURL_NETRC_LAST
EndEnumeration
Enumeration ; curl_sslversion
  #CURL_SSLVERSION_DEFAULT
  #CURL_SSLVERSION_TLSv1
  #CURL_SSLVERSION_SSLv2
  #CURL_SSLVERSION_SSLv3
  #CURL_SSLVERSION_LAST ;  never use keep last 
EndEnumeration
Enumeration ; curl_TimeCond
  #CURL_TIMECOND_NONE
  #CURL_TIMECOND_IFMODSINCE
  #CURL_TIMECOND_IFUNMODSINCE
  #CURL_TIMECOND_LASTMOD
  #CURL_TIMECOND_LAST
EndEnumeration ;
Enumeration    ; curlformoption
  #CURLFORM_NOTHING        ; the first one is unused
  #CURLFORM_COPYNAME
  #CURLFORM_PTRNAME
  #CURLFORM_NAMELENGTH
  #CURLFORM_COPYCONTENTS
  #CURLFORM_PTRCONTENTS
  #CURLFORM_CONTENTSLENGTH
  #CURLFORM_FILECONTENT
  #CURLFORM_ARRAY
  #CURLFORM_OBSOLETE
  #CURLFORM_FILE
  #CURLFORM_BUFFER
  #CURLFORM_BUFFERPTR
  #CURLFORM_BUFFERLENGTH
  #CURLFORM_CONTENTTYPE
  #CURLFORM_CONTENTHEADER
  #CURLFORM_FILENAME
  #CURLFORM_End
  #CURLFORM_OBSOLETE2
  #CURLFORM_LASTENTRY ;  the last unusued 
EndEnumeration
; use this For multipart formpost building 
; Returns code For #CURL_formadd()
; Returns:
; #CURL_FORMADD_OK             on success
; #CURL_FORMADD_MEMORY         If the FormInfo allocation fails
; #CURL_FORMADD_OPTION_TWICE   If one option is given twice For one Form
; #CURL_FORMADD_NULL           If a null pointer was given For a char
; #CURL_FORMADD_MEMORY         If the allocation of a FormInfo struct failed
; #CURL_FORMADD_UNKNOWN_OPTION If an unknown option was used
; #CURL_FORMADD_INCOMPLETE     If the some FormInfo is Not complete (Or error)
; #CURL_FORMADD_MEMORY         If a HttpPost struct cannot be allocated
; #CURL_FORMADD_MEMORY         If some allocation For string copying failed.
; #CURL_FORMADD_ILLEGAL_ARRAY  If an illegal option is used in an array
Enumeration ; CURLFORMcode
  #CURL_FORMADD_OK ; first no error 
  #CURL_FORMADD_MEMORY
  #CURL_FORMADD_OPTION_TWICE
  #CURL_FORMADD_NULL
  #CURL_FORMADD_UNKNOWN_OPTION
  #CURL_FORMADD_INCOMPLETE
  #CURL_FORMADD_ILLEGAL_ARRAY
  #CURL_FORMADD_DISABLED ; libcurl was built With this disabled 
  #CURL_FORMADD_LAST     ; last 
EndEnumeration
Enumeration ; CURL_closepolicy
  #CURLCLOSEPOLICY_NONE ; first never use this 
  #CURLCLOSEPOLICY_OLDEST
  #CURLCLOSEPOLICY_LEAST_RECENTLY_USED
  #CURLCLOSEPOLICY_LEAST_TRAFFIC
  #CURLCLOSEPOLICY_SLOWEST
  #CURLCLOSEPOLICY_CALLBACK
  #CURLCLOSEPOLICY_LAST ; last never use this 
EndEnumeration
; Different Data locks For a single share 
Enumeration 0 ; CURL_lock_data
  #CURL_LOCK_DATA_NONE
  ; #CURL_LOCK_DATA_SHARE is used internaly To say that
  ;   the locking is just made To change the internal state of the share
  ;   itself.
  #CURL_LOCK_DATA_SHARE
  #CURL_LOCK_DATA_COOKIE
  #CURL_LOCK_DATA_DNS
  #CURL_LOCK_DATA_SSL_SESSION
  #CURL_LOCK_DATA_CONNECT
  #CURL_LOCK_DATA_LAST
EndEnumeration ;
               ; Different lock access types 
Enumeration    ; CURL_lock_access
  #CURL_LOCK_ACCESS_NONE  = 0   ; unspecified action 
  #CURL_LOCK_ACCESS_SHARED = 1  ; For Read perhaps 
  #CURL_LOCK_ACCESS_SINGLE = 2  ; For write perhaps 
  #CURL_LOCK_ACCESS_LAST        ; never use 
EndEnumeration                  ;
Enumeration                     ; CURLSHcode
  #CURLSHE_OK                   ; all is fine 
  #CURLSHE_BAD_OPTION           ; 1 
  #CURLSHE_IN_USE               ; 2 
  #CURLSHE_INVALID              ; 3 
  #CURLSHE_NOMEM                ; out of memory 
  #CURLSHE_LAST                 ; never use 
EndEnumeration
Enumeration ; CURLSHoption
  #CURLSHOPT_NONE       ; don't use 
  #CURLSHOPT_SHARE      ; specify a Data type To share 
  #CURLSHOPT_UNSHARE    ; specify shich Data type To stop sharing 
  #CURLSHOPT_LOCKFUNC   ; pass in a '#CURL_lock_function' pointer 
  #CURLSHOPT_UNLOCKFUNC ; pass in a '#CURL_unlock_function' pointer 
  #CURLSHOPT_USERDATA   ; pass in a user Data pointer used in the lock/unlock
                        ;   callback functions 
  #CURLSHOPT_LAST       ; never use 
EndEnumeration
Enumeration ; CURLversion
  #CURLVERSION_FIRST
  #CURLVERSION_SECOND
  #CURLVERSION_THIRD
  #CURLVERSION_FOURTH
  #CURLVERSION_LAST     ; never actually use this 
EndEnumeration
;}

;{ Constantes 
#CURL_IPRESOLVE_WHATEVER  = 0 ; Default resolves addresses To all IP versions that your system allows 
#CURL_IPRESOLVE_V4        = 1 ; resolve To ipv4 addresses 
#CURL_IPRESOLVE_V6        = 2 ; resolve To ipv6 addresses 

#CURLOPT_HTTPREQUEST      = -1
; #CURLOPT_FTPASCII         = #CURLOPT_TRANSFERTEXT
#CURLOPT_MUTE             = -2
#CURLOPT_PASSWDFUNCTION   = -3
#CURLOPT_PASSWDDATA       = -4
#CURLOPT_CLOSEFUNCTION    = -5
#CURLOPT_SOURCE_HOST      = -6
#CURLOPT_SOURCE_PATH      = -7
#CURLOPT_SOURCE_PORT      = -8
#CURLOPT_PASV_HOST        = -9

#CURLOPT_INFILESIZE           = 00014
#CURLOPT_VERBOSE              = 00041
#CURLOPT_HEADER               = 00042
#CURLOPT_UPLOAD               = 00046
#CURLOPT_FOLLOWLOCATION       = 00052
#CURLOPT_SSL_VERIFYPEER       = 00064
#CURLOPT_SSL_VERIFYHOST       = 00081
#CURLOPT_IGNORE_CONTENT_LENGTH= 00136
#CURLOPT_FILE                 = 10001
#CURLOPT_URL                  = 10002
#CURLOPT_USERPWD              = 10005
#CURLOPT_INFILE               = 10009
#CURLOPT_WRITEHEADER          = 10029
#CURLOPT_POSTQUOTE            = 10039

#CURLOPT_INFILESIZE_LARGE     = 30115

#CURLOPTTYPE_OBJECTPOINT      = 10000
#CURLOPT_POSTFIELDS           = #CURLOPTTYPE_OBJECTPOINT + 15

#CURLOPTTYPE_FUNCTIONPOINT    = 20000
#CURLOPT_WRITEFUNCTION        = #CURLOPTTYPE_FUNCTIONPOINT + 11
#CURLOPT_HEADERFUNCTION       = #CURLOPTTYPE_FUNCTIONPOINT + 79

; Three convenient "aliases" that follow the name scheme better 
#CURLOPT_WRITEDATA        = #CURLOPT_FILE
#CURLOPT_READDATA         = #CURLOPT_INFILE
#CURLOPT_HEADERDATA       = #CURLOPT_WRITEHEADER

#CURL_GLOBAL_ALL          = $00000003
#CURL_GLOBAL_DEFAULT      = $00000003

#CURL_MAX_WRITE_SIZE      = 16384
#CURL_READFUNC_ABORT      = $10000000
;{ #CURLINFO
#CURLINFO_STRING   = $100000
#CURLINFO_LONG     = $200000
#CURLINFO_DOUBLE   = $300000
#CURLINFO_SLIST    = $400000
#CURLINFO_MASK     = $0fffff
#CURLINFO_TYPEMASK = $f00000

#CURLINFO_EFFECTIVE_URL             = #CURLINFO_STRING + 1
#CURLINFO_RESPONSE_CODE             = #CURLINFO_LONG   + 2
#CURLINFO_TOTAL_TIME                = #CURLINFO_DOUBLE + 3
#CURLINFO_NAMELOOKUP_TIME           = #CURLINFO_DOUBLE + 4
#CURLINFO_CONNECT_TIME              = #CURLINFO_DOUBLE + 5
#CURLINFO_PRETRANSFER_TIME          = #CURLINFO_DOUBLE + 6
#CURLINFO_SIZE_UPLOAD               = #CURLINFO_DOUBLE + 7
#CURLINFO_SIZE_DOWNLOAD             = #CURLINFO_DOUBLE + 8
#CURLINFO_SPEED_DOWNLOAD            = #CURLINFO_DOUBLE + 9
#CURLINFO_SPEED_UPLOAD              = #CURLINFO_DOUBLE + 10
#CURLINFO_HEADER_SIZE               = #CURLINFO_LONG   + 11
#CURLINFO_REQUEST_SIZE              = #CURLINFO_LONG   + 12
#CURLINFO_SSL_VERIFYRESULT          = #CURLINFO_LONG   + 13
#CURLINFO_FILETIME                  = #CURLINFO_LONG   + 14
#CURLINFO_CONTENT_LENGTH_DOWNLOAD   = #CURLINFO_DOUBLE + 15
#CURLINFO_CONTENT_LENGTH_UPLOAD     = #CURLINFO_DOUBLE + 16
#CURLINFO_STARTTRANSFER_TIME        = #CURLINFO_DOUBLE + 17
#CURLINFO_CONTENT_TYPE              = #CURLINFO_STRING + 18
#CURLINFO_REDIRECT_TIME             = #CURLINFO_DOUBLE + 19
#CURLINFO_REDIRECT_COUNT            = #CURLINFO_LONG   + 20
#CURLINFO_PRIVATE                   = #CURLINFO_STRING + 21
#CURLINFO_HTTP_CONNECTCODE          = #CURLINFO_LONG   + 22
#CURLINFO_HTTPAUTH_AVAIL            = #CURLINFO_LONG   + 23
#CURLINFO_PROXYAUTH_AVAIL           = #CURLINFO_LONG   + 24
#CURLINFO_OS_ERRNO                  = #CURLINFO_LONG   + 25
#CURLINFO_NUM_CONNECTS              = #CURLINFO_LONG   + 26
#CURLINFO_SSL_ENGINES               = #CURLINFO_SLIST  + 27
#CURLINFO_COOKIELIST                = #CURLINFO_SLIST  + 28
#CURLINFO_LASTSOCKET                = #CURLINFO_LONG   + 29
#CURLINFO_FTP_ENTRY_PATH            = #CURLINFO_STRING + 30
#CURLINFO_LASTONE                   = 30
#CURLINFO_HTTP_CODE                 = #CURLINFO_RESPONSE_CODE
;}
;{ #CURLOPT
#CURLOPTTYPE_LONG          = 0
#CURLOPTTYPE_OBJECTPOINT   = 10000
#CURLOPTTYPE_FUNCTIONPOINT = 20000
#CURLOPTTYPE_OFF_T         = 30000

;This Macro-mania below setups the CURLOPT_[what] enum + To be used With
;curl_easy_setopt(). The first argument in the CURLOPT_) Macro is the [what] word.

; This is the FILE;Or void;the regular output should be written To. 
#CURLOPT_FILE = #CURLOPTTYPE_OBJECTPOINT + 1
; The full URL To get/put 
#CURLOPT_URL= #CURLOPTTYPE_OBJECTPOINT + 2
; Port number To connect To + If other than Default. 
#CURLOPT_PORT= #CURLOPTTYPE_LONG + 3
; Name of proxy To use. 
#CURLOPT_PROXY= #CURLOPTTYPE_OBJECTPOINT + 4
; "name:password" To use when fetching. 
#CURLOPT_USERPWD= #CURLOPTTYPE_OBJECTPOINT + 5
; "name:password" To use With proxy. 
#CURLOPT_PROXYUSERPWD= #CURLOPTTYPE_OBJECTPOINT + 6
; Range To get + specified As an ASCII string. 
#CURLOPT_RANGE= #CURLOPTTYPE_OBJECTPOINT + 7
; Specified file stream To upload from (use As input): 
#CURLOPT_INFILE= #CURLOPTTYPE_OBJECTPOINT + 9
; Buffer To receive error messages in + must be at least CURL_ERROR_SIZE
;   bytes big. If this is Not used + error messages go To stderr instead: 
#CURLOPT_ERRORBUFFER= #CURLOPTTYPE_OBJECTPOINT + 10
; Function that will be called To store the output (instead of fwrite). The
;   parameters will use fwrite() syntax + make sure To follow them. 
#CURLOPT_WRITEFUNCTION= #CURLOPTTYPE_FUNCTIONPOINT + 11
; Function that will be called To Read the Input (instead of fread). The
;   parameters will use fread() syntax + make sure To follow them. 
#CURLOPT_READFUNCTION= #CURLOPTTYPE_FUNCTIONPOINT + 12
; Time-out the Read operation after this amount of seconds 
#CURLOPT_TIMEOUT= #CURLOPTTYPE_LONG + 13
; If the CURLOPT_INFILE is used + this can be used To inform libcurl about
;   how large the file being sent really is. That allows better error
;   checking And better verifies that the upload was succcessful. -1 means
;   unknown size.
;   For large file support + there is also a _LARGE version of the key
;   which takes an off_t type + allowing platforms With larger off_t
;   sizes To handle larger files.  See below For INFILESIZE_LARGE.
#CURLOPT_INFILESIZE= #CURLOPTTYPE_LONG + 14
; POST input fields. 
#CURLOPT_POSTFIELDS= #CURLOPTTYPE_OBJECTPOINT + 15
; Set the referer page (needed by some CGIs) 
#CURLOPT_REFERER= #CURLOPTTYPE_OBJECTPOINT + 16
; Set the FTP PORT string (Interface name + named Or numerical IP address)
;   Use i.e '-' To use Default address. 
#CURLOPT_FTPPORT= #CURLOPTTYPE_OBJECTPOINT + 17
; Set the User-Agent string (examined by some CGIs) 
#CURLOPT_USERAGENT= #CURLOPTTYPE_OBJECTPOINT + 18
; If the download receives less than "low speed limit" bytes/second
;   during "low speed time" seconds + the operations is aborted.
;   You could i.e If you have a pretty high speed connection + abort If
;   it is less than 2000 bytes/sec during 20 seconds.
;   Set the "low speed limit" 
#CURLOPT_LOW_SPEED_LIMIT= #CURLOPTTYPE_LONG + 19
; Set the "low speed time" 
#CURLOPT_LOW_SPEED_TIME= #CURLOPTTYPE_LONG + 20
; Set the continuation offset.
;   Note there is also a _LARGE version of this key which uses
;   off_t types + allowing For large file offsets on platforms which
;   use larger-than-32-bit off_t's.  Look below for RESUME_FROM_LARGE.
#CURLOPT_RESUME_FROM= #CURLOPTTYPE_LONG + 21
; Set cookie in request: 
#CURLOPT_COOKIE= #CURLOPTTYPE_OBJECTPOINT + 22
; This points To a linked list of headers + struct curl_slist kind 
#CURLOPT_HTTPHEADER= #CURLOPTTYPE_OBJECTPOINT + 23
; This points To a linked list of post entries + struct HttpPost 
#CURLOPT_HTTPPOST= #CURLOPTTYPE_OBJECTPOINT + 24
; name of the file keeping your private SSL-certificate 
#CURLOPT_SSLCERT= #CURLOPTTYPE_OBJECTPOINT + 25
; password For the SSL Or SSH private key 
#CURLOPT_KEYPASSWD= #CURLOPTTYPE_OBJECTPOINT + 26
; send TYPE parameter? 
#CURLOPT_CRLF= #CURLOPTTYPE_LONG + 27
; send linked-list of QUOTE commands 
#CURLOPT_QUOTE= #CURLOPTTYPE_OBJECTPOINT + 28
; send FILE;Or void;To store headers To + If you use a callback it
;   is simply passed To the callback unmodified 
#CURLOPT_WRITEHEADER= #CURLOPTTYPE_OBJECTPOINT + 29
; point To a file To Read the initial cookies from + also enables
;   "cookie awareness" 
#CURLOPT_COOKIEFILE= #CURLOPTTYPE_OBJECTPOINT + 31
; What version To specifly try To use.
;   See CURL_SSLVERSION defines below. 
#CURLOPT_SSLVERSION= #CURLOPTTYPE_LONG + 32
; What kind of HTTP time condition To use + see defines 
#CURLOPT_TIMECONDITION= #CURLOPTTYPE_LONG + 33
; Time To use With the above condition. Specified in number of seconds
;   since 1 Jan 1970 
#CURLOPT_TIMEVALUE= #CURLOPTTYPE_LONG + 34
; Custom request= #CURLOPTTYPE_For customizing the get command like
;   HTTP: DELETE + TRACE And others
;   FTP: To use a different list command
#CURLOPT_CUSTOMREQUEST= #CURLOPTTYPE_OBJECTPOINT + 36
; HTTP request= #CURLOPTTYPE_For odd commands like DELETE + TRACE And others 
#CURLOPT_STDERR= #CURLOPTTYPE_OBJECTPOINT + 37
; send linked-list of post-transfer QUOTE commands 
#CURLOPT_POSTQUOTE= #CURLOPTTYPE_OBJECTPOINT + 39
; Pass a pointer To string of the output using full variable-replacement
;   As described elsewhere. 
#CURLOPT_WRITEINFO= #CURLOPTTYPE_OBJECTPOINT + 40
#CURLOPT_VERBOSE= #CURLOPTTYPE_LONG + 41      ; talk a lot 
#CURLOPT_HEADER= #CURLOPTTYPE_LONG + 42       ; throw the header out too 
#CURLOPT_NOPROGRESS= #CURLOPTTYPE_LONG + 43   ; shut off the progress meter 
#CURLOPT_NOBODY= #CURLOPTTYPE_LONG + 44       ; use HEAD To get http document 
#CURLOPT_FAILONERROR= #CURLOPTTYPE_LONG + 45  ; no output on http error codes >= 300 
#CURLOPT_UPLOAD= #CURLOPTTYPE_LONG + 46       ; this is an upload 
#CURLOPT_POST= #CURLOPTTYPE_LONG + 47         ; HTTP POST method 
#CURLOPT_DIRLISTONLY= #CURLOPTTYPE_LONG + 48  ; Return bare names when listing directories 
#CURLOPT_APPEND= #CURLOPTTYPE_LONG + 50       ; Append instead of overwrite on upload! 
                                              ; Specify whether To Read the user+password from the .netrc Or the URL.
                                              ;   This must be one of the CURL_NETRC_* enums below. 
#CURLOPT_NETRC= #CURLOPTTYPE_LONG + 51
#CURLOPT_FOLLOWLOCATION= #CURLOPTTYPE_LONG + 52  ; use Location: Luke! 
#CURLOPT_TRANSFERTEXT= #CURLOPTTYPE_LONG + 53    ; transfer Data in text/ASCII format 
#CURLOPT_PUT= #CURLOPTTYPE_LONG + 54             ; HTTP PUT 
                                                 ; Function that will be called instead of the internal progress display
                                                 ;   function. This function should be defined As the curl_progress_callback
                                                 ;   Prototype defines. 
#CURLOPT_PROGRESSFUNCTION= #CURLOPTTYPE_FUNCTIONPOINT + 56
; Data passed To the progress callback 
#CURLOPT_PROGRESSDATA= #CURLOPTTYPE_OBJECTPOINT + 57
; We want the referer field set automatically when following locations 
#CURLOPT_AUTOREFERER= #CURLOPTTYPE_LONG + 58
; Port of the proxy + can be set in the proxy string As well With:
;   "[host]:[port]" 
#CURLOPT_PROXYPORT= #CURLOPTTYPE_LONG + 59
; size of the POST input Data + If strlen() is Not good To use 
#CURLOPT_POSTFIELDSIZE= #CURLOPTTYPE_LONG + 60
; tunnel non-http operations through a HTTP proxy 
#CURLOPT_HTTPPROXYTUNNEL= #CURLOPTTYPE_LONG + 61
; Set the Interface string To use As outgoing network Interface 
#CURLOPT_INTERFACE= #CURLOPTTYPE_OBJECTPOINT + 62
; Set the krb4/5 security level + this also enables krb4/5 awareness.  This
;   is a string + 'clear' + 'safe' + 'confidential' Or 'private'.  If the string
;   is set but doesn't match one of these + 'private' will be used.  
#CURLOPT_KRBLEVEL= #CURLOPTTYPE_OBJECTPOINT + 63
; Set If we should verify the peer in ssl handshake + set 1 To verify. 
#CURLOPT_SSL_VERIFYPEER= #CURLOPTTYPE_LONG + 64
; The CApath Or CAfile used To validate the peer certificate
;   this option is used only If SSL_VERIFYPEER is true 
#CURLOPT_CAINFO= #CURLOPTTYPE_OBJECTPOINT + 65
; Maximum number of http redirects To follow 
#CURLOPT_MAXREDIRS= #CURLOPTTYPE_LONG + 68
; Pass a long set To 1 To get the date of the requested document (If
;   possible)! Pass a zero To shut it off. 
#CURLOPT_FILETIME= #CURLOPTTYPE_LONG + 69
; This points To a linked list of telnet options 
#CURLOPT_TELNETOPTIONS= #CURLOPTTYPE_OBJECTPOINT + 70
; Max amount of cached alive connections 
#CURLOPT_MAXCONNECTS= #CURLOPTTYPE_LONG + 71
; What policy To use when closing connections when the cache is filled up 
#CURLOPT_CLOSEPOLICY= #CURLOPTTYPE_LONG + 72
; Set To explicitly use a new connection For the upcoming transfer.
;   Do Not use this unless you're absolutely sure of this + as it makes the
;   operation slower And is less friendly For the network. 
#CURLOPT_FRESH_CONNECT= #CURLOPTTYPE_LONG + 74
; Set To explicitly forbid the upcoming transfer's connection to be re-used
;   when done. Do Not use this unless you're absolutely sure of this + as it
;   makes the operation slower And is less friendly For the network. 
#CURLOPT_FORBID_REUSE= #CURLOPTTYPE_LONG + 75
; Set To a file name that contains random Data For libcurl To use To
;   seed the random engine when doing SSL connects. 
#CURLOPT_RANDOM_FILE= #CURLOPTTYPE_OBJECTPOINT + 76
; Set To the Entropy Gathering Daemon socket pathname 
#CURLOPT_EGDSOCKET= #CURLOPTTYPE_OBJECTPOINT + 77
; Time-out connect operations after this amount of seconds + If connects
;   are OK within this time + then fine... This only aborts the connect
;   phase. [Only works on unix-style/SIGALRM operating systems] 
#CURLOPT_CONNECTTIMEOUT= #CURLOPTTYPE_LONG + 78
; Function that will be called To store headers (instead of fwrite). The
;   parameters will use fwrite() syntax + make sure To follow them. 
#CURLOPT_HEADERFUNCTION= #CURLOPTTYPE_FUNCTIONPOINT + 79
; Set this To force the HTTP request To get back To GET. Only really usable
;   If POST + PUT Or a custom request have been used first.
#CURLOPT_HTTPGET= #CURLOPTTYPE_LONG + 80
; Set If we should verify the Common name from the peer certificate in ssl
;   handshake + set 1 To check existence + 2 To ensure that it matches the
;   provided hostname. 
#CURLOPT_SSL_VERIFYHOST= #CURLOPTTYPE_LONG + 81
; Specify which file name To write all known cookies in after completed
;   operation. Set file name To "-" (dash) To make it go To stdout. 
#CURLOPT_COOKIEJAR= #CURLOPTTYPE_OBJECTPOINT + 82
; Specify which SSL ciphers To use 
#CURLOPT_SSL_CIPHER_LIST= #CURLOPTTYPE_OBJECTPOINT + 83
; Specify which HTTP version To use! This must be set To one of the
;   CURL_HTTP_VERSION* enums set below. 
#CURLOPT_HTTP_VERSION= #CURLOPTTYPE_LONG + 84
; Specificly switch on Or off the FTP engine's use of the EPSV command. By
;   Default + that one will always be attempted before the more traditional
;   PASV command. 
#CURLOPT_FTP_USE_EPSV= #CURLOPTTYPE_LONG + 85
; type of the file keeping your SSL-certificate ("DER" + "PEM" + "ENG") 
#CURLOPT_SSLCERTTYPE= #CURLOPTTYPE_OBJECTPOINT + 86
; name of the file keeping your private SSL-key 
#CURLOPT_SSLKEY= #CURLOPTTYPE_OBJECTPOINT + 87
; type of the file keeping your private SSL-key ("DER" + "PEM" + "ENG") 
#CURLOPT_SSLKEYTYPE= #CURLOPTTYPE_OBJECTPOINT + 88
; crypto engine For the SSL-sub system 
#CURLOPT_SSLENGINE= #CURLOPTTYPE_OBJECTPOINT + 89
; set the crypto engine For the SSL-sub system As Default
;   the param has no meaning...
#CURLOPT_SSLENGINE_DEFAULT= #CURLOPTTYPE_LONG + 90
; Non-zero value means To use the Global dns cache 
#CURLOPT_DNS_USE_GLOBAL_CACHE= #CURLOPTTYPE_LONG + 91 ; To become OBSOLETE soon 
                                                      ; DNS cache timeout 
#CURLOPT_DNS_CACHE_TIMEOUT= #CURLOPTTYPE_LONG + 92
; send linked-list of pre-transfer QUOTE commands (Wesley Laxton)
#CURLOPT_PREQUOTE= #CURLOPTTYPE_OBJECTPOINT + 93
; set the Debug function 
#CURLOPT_DEBUGFUNCTION= #CURLOPTTYPE_FUNCTIONPOINT + 94
; set the Data For the Debug function 
#CURLOPT_DEBUGDATA= #CURLOPTTYPE_OBJECTPOINT + 95
; mark this As start of a cookie session 
#CURLOPT_COOKIESESSION= #CURLOPTTYPE_LONG + 96
; The CApath directory used To validate the peer certificate
;   this option is used only If SSL_VERIFYPEER is true 
#CURLOPT_CAPATH= #CURLOPTTYPE_OBJECTPOINT + 97
; Instruct libcurl To use a smaller receive buffer 
#CURLOPT_BUFFERSIZE= #CURLOPTTYPE_LONG + 98
; Instruct libcurl To Not use any signal/alarm handlers + even when using
;   timeouts. This option is useful For multi-threaded applications.
;   See libcurl-the-guide For more background information. 
#CURLOPT_NOSIGNAL= #CURLOPTTYPE_LONG + 99
; Provide a CURLShare For mutexing non-ts Data 
#CURLOPT_SHARE= #CURLOPTTYPE_OBJECTPOINT + 100
; indicates type of proxy. accepted values are CURLPROXY_HTTP (Default
;   CURLPROXY_SOCKS4 And CURLPROXY_SOCKS5. 
#CURLOPT_PROXYTYPE= #CURLOPTTYPE_LONG + 101
; Set the Accept-Encoding string. Use this To tell a server you would like
;   the response To be compressed. 
#CURLOPT_ENCODING= #CURLOPTTYPE_OBJECTPOINT + 102
; Set pointer To private Data 
#CURLOPT_PRIVATE= #CURLOPTTYPE_OBJECTPOINT + 103
; Set aliases For HTTP 200 in the HTTP Response header 
#CURLOPT_HTTP200ALIASES= #CURLOPTTYPE_OBJECTPOINT + 104
; Continue To send authentication (user+password) when following locations,
;   even when hostname changed. This can potentionally send off the name
;   And password To whatever host the server decides. 
#CURLOPT_UNRESTRICTED_AUTH= #CURLOPTTYPE_LONG + 105
; Specificly switch on Or off the FTP engine's use of the EPRT command ( it
;   also disables the LPRT attempt). By Default + those ones will always be
;   attempted before the good old traditional PORT command. 
#CURLOPT_FTP_USE_EPRT= #CURLOPTTYPE_LONG + 106
; Set this To a bitmask value To enable the particular authentications
;   methods you like. Use this in combination With CURLOPT_USERPWD.
;   Note that setting multiple bits may cause extra network round-trips. 
#CURLOPT_HTTPAUTH= #CURLOPTTYPE_LONG + 107
; Set the ssl context callback function + currently only For OpenSSL ssl_ctx
;   in second argument. The function must be matching the
;   curl_ssl_ctx_callback proto. 
#CURLOPT_SSL_CTX_FUNCTION= #CURLOPTTYPE_FUNCTIONPOINT + 108
; Set the userdata For the ssl context callback function's third
;   argument 
#CURLOPT_SSL_CTX_DATA= #CURLOPTTYPE_OBJECTPOINT + 109
; FTP Option that causes missing dirs To be created on the remote server 
#CURLOPT_FTP_CREATE_MISSING_DIRS= #CURLOPTTYPE_LONG + 110
; Set this To a bitmask value To enable the particular authentications
;   methods you like. Use this in combination With CURLOPT_PROXYUSERPWD.
;   Note that setting multiple bits may cause extra network round-trips. 
#CURLOPT_PROXYAUTH= #CURLOPTTYPE_LONG + 111
; FTP option that changes the timeout + in seconds + associated With
;   getting a response.  This is different from transfer timeout time And
;   essentially places a demand on the FTP server To acknowledge commands
;   in a timely manner. 
#CURLOPT_FTP_RESPONSE_TIMEOUT= #CURLOPTTYPE_LONG + 112
; Set this option To one of the CURL_IPRESOLVE_* defines (see below) To
;   tell libcurl To resolve names To those IP versions only. This only has
;   affect on systems With support For more than one + i.e IPv4 _and_ IPv6. 
#CURLOPT_IPRESOLVE= #CURLOPTTYPE_LONG + 113
; Set this option To limit the size of a file that will be downloaded from
;   an HTTP Or FTP server.
;   Note there is also _LARGE version which adds large file support For
;   platforms which have larger off_t sizes.  See MAXFILESIZE_LARGE below. 
#CURLOPT_MAXFILESIZE= #CURLOPTTYPE_LONG + 114
; See the comment For INFILESIZE above + but in short + specifies
;   the size of the file being uploaded.  -1 means unknown.
#CURLOPT_INFILESIZE_LARGE= #CURLOPTTYPE_OFF_T + 115
; Sets the continuation offset.  There is also a LONG version of this;
;   look above For RESUME_FROM.
#CURLOPT_RESUME_FROM_LARGE= #CURLOPTTYPE_OFF_T + 116
; Sets the maximum size of Data that will be downloaded from
;   an HTTP Or FTP server.  See MAXFILESIZE above For the LONG version.
#CURLOPT_MAXFILESIZE_LARGE= #CURLOPTTYPE_OFF_T + 117
; Set this option To the file name of your .netrc file you want libcurl
;   To parse (using the CURLOPT_NETRC option). If Not set= #CURLOPTTYPE_Libcurl will do
;   a poor attempt To find the user's home directory and check for a .netrc
;   file in there. 
#CURLOPT_NETRC_FILE= #CURLOPTTYPE_OBJECTPOINT + 118
; Enable SSL/TLS For FTP + pick one of:
;   CURLFTPSSL_TRY     - try using SSL + proceed anyway otherwise
;   CURLFTPSSL_CONTROL - SSL For the control connection Or fail
;   CURLFTPSSL_ALL     - SSL For all communication Or fail
#CURLOPT_USE_SSL= #CURLOPTTYPE_LONG + 119
; The _LARGE version of the standard POSTFIELDSIZE option 
#CURLOPT_POSTFIELDSIZE_LARGE= #CURLOPTTYPE_OFF_T + 120
; Enable/disable the TCP Nagle algorithm 
#CURLOPT_TCP_NODELAY= #CURLOPTTYPE_LONG + 121
; 122 OBSOLETE + used in 7.12.3. Gone in 7.13.0 
; 123 OBSOLETE. Gone in 7.16.0 
; 124 OBSOLETE + used in 7.12.3. Gone in 7.13.0 
; 125 OBSOLETE + used in 7.12.3. Gone in 7.13.0 
; 126 OBSOLETE + used in 7.12.3. Gone in 7.13.0 
; 127 OBSOLETE. Gone in 7.16.0 
; 128 OBSOLETE. Gone in 7.16.0 
; When FTP over SSL/TLS is selected (With CURLOPT_USE_SSL this option
;   can be used To change libcurl's default action which is to first try
;   "AUTH SSL" And then "AUTH TLS" in this order + And proceed when a OK
;   response has been received.
;   Available parameters are:
;   CURLFTPAUTH_DEFAULT - let libcurl decide
;   CURLFTPAUTH_SSL     - try "AUTH SSL" first + then TLS
;   CURLFTPAUTH_TLS     - try "AUTH TLS" first + then SSL
#CURLOPT_FTPSSLAUTH= #CURLOPTTYPE_LONG + 129
#CURLOPT_IOCTLFUNCTION= #CURLOPTTYPE_FUNCTIONPOINT + 130
#CURLOPT_IOCTLDATA= #CURLOPTTYPE_OBJECTPOINT + 131
; 132 OBSOLETE. Gone in 7.16.0 
; 133 OBSOLETE. Gone in 7.16.0 
; zero terminated string For pass on To the FTP server when asked For
;   "account" info 
#CURLOPT_FTP_ACCOUNT= #CURLOPTTYPE_OBJECTPOINT + 134
; feed cookies into cookie engine 
#CURLOPT_COOKIELIST= #CURLOPTTYPE_OBJECTPOINT + 135
; ignore Content-Length 
#CURLOPT_IGNORE_CONTENT_LENGTH= #CURLOPTTYPE_LONG + 136
; Set To non-zero To skip the IP address received in a 227 PASV FTP server
;   response. Typically used For FTP-SSL purposes but is Not restricted To
;   that. libcurl will then instead use the same IP address it used For the
;   control connection. 
#CURLOPT_FTP_SKIP_PASV_IP= #CURLOPTTYPE_LONG + 137
; Select "file method" To use when doing FTP + see the curl_ftpmethod
;   above. 
#CURLOPT_FTP_FILEMETHOD= #CURLOPTTYPE_LONG + 138
; Local port number To bind the socket To 
#CURLOPT_LOCALPORT= #CURLOPTTYPE_LONG + 139
; Number of ports To try + including the first one set With LOCALPORT.
;   Thus + setting it To 1 will make no additional attempts but the first.
#CURLOPT_LOCALPORTRANGE= #CURLOPTTYPE_LONG + 140
; no transfer + set up connection And let application use the socket by
;   extracting it With CURLINFO_LASTSOCKET 
#CURLOPT_CONNECT_ONLY= #CURLOPTTYPE_LONG + 141
; Function that will be called To convert from the
;   network encoding (instead of using the iconv calls in libcurl) 
#CURLOPT_CONV_FROM_NETWORK_FUNCTION= #CURLOPTTYPE_FUNCTIONPOINT + 142
; Function that will be called To convert To the
;   network encoding (instead of using the iconv calls in libcurl) 
#CURLOPT_CONV_TO_NETWORK_FUNCTION= #CURLOPTTYPE_FUNCTIONPOINT + 143
; Function that will be called To convert from UTF8
;   (instead of using the iconv calls in libcurl)
;   Note that this is used only For SSL certificate processing 
#CURLOPT_CONV_FROM_UTF8_FUNCTION= #CURLOPTTYPE_FUNCTIONPOINT + 144
; If the connection proceeds too quickly then need To slow it down 
;   limit-rate: maximum number of bytes per second To send Or receive 
#CURLOPT_MAX_SEND_SPEED_LARGE= #CURLOPTTYPE_OFF_T + 145
#CURLOPT_MAX_RECV_SPEED_LARGE= #CURLOPTTYPE_OFF_T + 146
; Pointer To command string To send If USER/PASS fails. 
#CURLOPT_FTP_ALTERNATIVE_TO_USER= #CURLOPTTYPE_OBJECTPOINT + 147
; callback function For setting socket options 
#CURLOPT_SOCKOPTFUNCTION= #CURLOPTTYPE_FUNCTIONPOINT + 148
#CURLOPT_SOCKOPTDATA= #CURLOPTTYPE_OBJECTPOINT + 149
; set To 0 To disable session ID re-use For this transfer + Default is
;   enabled (== 1) 
#CURLOPT_SSL_SESSIONID_CACHE= #CURLOPTTYPE_LONG + 150
; allowed SSH authentication methods 
#CURLOPT_SSH_AUTH_TYPES= #CURLOPTTYPE_LONG + 151
; Used by scp/sftp To do public/private key authentication 
#CURLOPT_SSH_PUBLIC_KEYFILE= #CURLOPTTYPE_OBJECTPOINT + 152
#CURLOPT_SSH_PRIVATE_KEYFILE= #CURLOPTTYPE_OBJECTPOINT + 153
; Send CCC (Clear Command Channel) after authentication 
#CURLOPT_FTP_SSL_CCC= #CURLOPTTYPE_LONG + 154
; Same As TIMEOUT And CONNECTTIMEOUT + but With ms resolution 
#CURLOPT_TIMEOUT_MS= #CURLOPTTYPE_LONG + 155
#CURLOPT_CONNECTTIMEOUT_MS= #CURLOPTTYPE_LONG + 156
; set To zero To disable the libcurl's decoding and thus pass the raw body
;   Data To the appliction even when it is encoded/compressed 
#CURLOPT_HTTP_TRANSFER_DECODING= #CURLOPTTYPE_LONG + 157
#CURLOPT_HTTP_CONTENT_DECODING= #CURLOPTTYPE_LONG + 158
; Permission used when creating new files And directories on the remote
;   server For protocols that support it + SFTP/SCP/FILE 
#CURLOPT_NEW_FILE_PERMS= #CURLOPTTYPE_LONG + 159
#CURLOPT_NEW_DIRECTORY_PERMS= #CURLOPTTYPE_LONG + 160
; CURLOPT_LASTENTRY ; the last unused 
#CURLOPT_FTPLISTONLY =  #CURLOPT_DIRLISTONLY
;}
;{ #HTTPPOST
#HTTPPOST_FILENAME    = 1<<0 ; specified content is a file name 
#HTTPPOST_READFILE    = 1<<1 ; specified content is a file name 
#HTTPPOST_PTRNAME     = 1<<2 ; name is only stored pointer
                             ; do Not free in formfree 
#HTTPPOST_PTRCONTENTS = 1<<3 ; contents is only stored pointer
                             ; do Not free in formfree 
#HTTPPOST_BUFFER      = 1<<4 ; upload file from buffer 
#HTTPPOST_PTRBUFFER   = 1<<5 ; upload file from pointer contents 
                             ;}

; #CURLE_OBSOLETE                     = #CURLE_OBSOLETE50   ; noone should be using this! 
; #CURLE_BAD_PASSWORD_ENTERED         = #CURLE_OBSOLETE46
; #CURLE_BAD_CALLING_ORDER            = #CURLE_OBSOLETE44
; #CURLE_FTP_USER_PASSWORD_INCORRECT  = #CURLE_OBSOLETE10
; #CURLE_FTP_CANT_RECONNECT           = #CURLE_OBSOLETE16
; #CURLE_FTP_COULDNT_GET_SIZE         = #CURLE_OBSOLETE32
; #CURLE_FTP_COULDNT_SET_ASCII        = #CURLE_OBSOLETE29
; #CURLE_FTP_WEIRD_USER_REPLY         = #CURLE_OBSOLETE12
; #CURLE_FTP_WRITE_ERROR              = #CURLE_OBSOLETE20
; #CURLE_LIBRARY_NOT_FOUND            = #CURLE_OBSOLETE40
; #CURLE_MALFORMAT_USER               = #CURLE_OBSOLETE24
; #CURLE_SHARE_IN_USE                 = #CURLE_OBSOLETE57
; #CURLE_URL_MALFORMAT_USER           = #CURLE_OBSOLETE4

; #CURLE_FTP_ACCESS_DENIED            = #CURLE_REMOTE_ACCESS_DENIED
; #CURLE_FTP_COULDNT_SET_BINARY       = #CURLE_FTP_COULDNT_SET_TYPE
; #CURLE_FTP_QUOTE_ERROR              = #CURLE_QUOTE_ERROR
; #CURLE_TFTP_DISKFULL                = #CURLE_REMOTE_DISK_FULL
; #CURLE_TFTP_EXISTS                  = #CURLE_REMOTE_FILE_EXISTS
; #CURLE_HTTP_RANGE_ERROR             = #CURLE_RANGE_ERROR 
; #CURLE_FTP_SSL_FAILED               = #CURLE_USE_SSL_FAILED

; #CURLE_OPERATION_TIMEOUTED          = #CURLE_OPERATION_TIMEDOUT

#CURLE_HTTP_NOT_FOUND               = #CURLE_HTTP_RETURNED_ERROR
#CURLE_HTTP_PORT_FAILED             = #CURLE_INTERFACE_FAILED
; #CURLE_FTP_COULDNT_STOR_FILE        = #CURLE_UPLOAD_FAILED

#CURLE_FTP_PARTIAL_FILE             = #CURLE_PARTIAL_FILE
#CURLE_FTP_BAD_DOWNLOAD_RESUME      = #CURLE_BAD_DOWNLOAD_RESUME

#CURLE_ALREADY_COMPLETE = 99999

#CURLAUTH_NONE          = 0       ; nothing 
#CURLAUTH_BASIC         = 1<<0    ; Basic (Default) 
#CURLAUTH_DIGEST        = 1<<1    ; Digest 
#CURLAUTH_GSSNEGOTIATE  = 1<<2    ; GSS-Negotiate 
#CURLAUTH_NTLM          = 1<<3    ; NTLM 
#CURLAUTH_ANY           = ~0      ; all types set 
#CURLAUTH_ANYSAFE       = ~#CURLAUTH_BASIC

#CURLSSH_AUTH_ANY       = ~0      ; all types supported by the server 
#CURLSSH_AUTH_NONE      = 0       ; none allowed, silly but complete 
#CURLSSH_AUTH_PUBLICKEY = 1<<0    ; public/private key files 
#CURLSSH_AUTH_PASSWORD  = 1<<1    ; password 
#CURLSSH_AUTH_HOST      = 1<<2    ; host key files 
#CURLSSH_AUTH_KEYBOARD  = 1<<3    ; keyboard interactive 
#CURLSSH_AUTH_DEFAULT   = #CURLSSH_AUTH_ANY

#CURL_ERROR_SIZE        = 256


#CURLFTPSSL_NONE    = #CURLUSESSL_NONE
#CURLFTPSSL_TRY     = #CURLUSESSL_TRY
#CURLFTPSSL_CONTROL = #CURLUSESSL_CONTROL
#CURLFTPSSL_ALL     = #CURLUSESSL_ALL
#CURLFTPSSL_LAST    = #CURLUSESSL_LAST

#CURLOPT_SSLKEYPASSWD = #CURLOPT_KEYPASSWD 
#CURLOPT_FTPAPPEND    = #CURLOPT_APPEND
#CURLOPT_FTPLISTONLY  = #CURLOPT_DIRLISTONLY
#CURLOPT_FTP_SSL      = #CURLOPT_USE_SSL

#CURLOPT_SSLCERTPASSWD = #CURLOPT_KEYPASSWD
#CURLOPT_KRB4LEVEL     = #CURLOPT_KRBLEVEL
; Below here follows defines for the CURLOPT_IPRESOLVE option. If a host
; name resolves addresses using more than one IP protocol version, this
; option might be handy to force libcurl to use a specific IP version. 
#CURL_IPRESOLVE_WHATEVER = 0 ; Default, resolves addresses To all IP   versions that your system allows 
#CURL_IPRESOLVE_V4       = 1 ; resolve To ipv4 addresses 
#CURL_IPRESOLVE_V6       = 2 ; resolve To ipv6 addresses 

; three convenient "aliases" that follow the name scheme better 
#CURLOPT_WRITEDATA  = #CURLOPT_FILE
#CURLOPT_READDATA   = #CURLOPT_INFILE
#CURLOPT_HEADERDATA = #CURLOPT_WRITEHEADER
; CURLINFO_RESPONSE_CODE is the new name For the option previously known As
;   CURLINFO_HTTP_CODE 
#CURLINFO_HTTP_CODE = #CURLINFO_RESPONSE_CODE

#CURL_GLOBAL_SSL    = 1<<0
#CURL_GLOBAL_WIN32  = 1<<1
#CURL_GLOBAL_ALL    = #CURL_GLOBAL_SSL|#CURL_GLOBAL_WIN32
#CURL_GLOBAL_NOTHING= 0
#CURL_GLOBAL_DEFAULT= #CURL_GLOBAL_ALL
;The 'CURLVERSION_NOW' is the symbolic name meant To be used by
;  basicly all programs ever, that want To get version information. It is
;  meant To be a built-in version number For what kind of struct the caller
;  expects. If the struct ever changes, we rethe NOW To another enum
;  from above. 
#CURLVERSION_NOW    = #CURLVERSION_FOURTH

#CURL_VERSION_IPV6      = 1<<0   ;IPv6-enabled 
#CURL_VERSION_KERBEROS4 = 1<<1   ;kerberos auth is supported 
#CURL_VERSION_SSL       = 1<<2   ;SSL options are present 
#CURL_VERSION_LIBZ      = 1<<3   ;libz features are present 
#CURL_VERSION_NTLM      = 1<<4   ;NTLM auth is supported 
#CURL_VERSION_GSSNEGOTIATE = 1<<5;  Negotiate auth support 
#CURL_VERSION_DEBUG     = 1<<6   ;built With Debug capabilities 
#CURL_VERSION_ASYNCHDNS = 1<<7   ;asynchronous dns resolves 
#CURL_VERSION_SPNEGO    = 1<<8   ;SPNEGO auth 
#CURL_VERSION_LARGEFILE = 1<<9   ;supports files bigger than 2GB 
#CURL_VERSION_IDN       = 1<<10  ;International Domain Names support 
#CURL_VERSION_SSPI      = 1<<11  ;SSPI is supported 
#CURL_VERSION_CONV      = 1<<12  ;character conversions are supported 

Structure Curl_HTTPPost
  *Next_.Curl_HTTPPost ; Next entry in the list
  *name.String         ; Ptr to allocated name
  namelength.l         ; Length of name length
  *contents.String     ; Ptr to allocated data contents
  contentslength.l     ; Length of contents field
  *buffer.String       ; Ptr to allocated buffer contents
  bufferlength.l       ; Length of buffer field
  *contenttype.String  ; Content-Type
  *contentheader       ; List of extra headers for this form
  *more.Curl_HTTPPost  ; If one field name has more than one
                       ;   file, this link should link To following files
  flags.l              ; constante #HTTPPOST
  *showfilename        ; The file name to show. If not set, the
                       ;   actual file name will be used (If this
                       ;   is a file part)
EndStructure

; Structure To be used As parameter For CURLFORM_ARRAY
Structure Curl_Forms
  option.l
  *value.String
EndStructure

; linked-list Structure For the CURLOPT_QUOTE option (And other)
Structure Curl_Slist
  *Data.String
  *Next_.curl_slist
EndStructure

Structure curl_version_info_data
  age.l               ; age of the returned struct
  *version.String     ; LIBCURL_VERSION
  version_num.l       ; LIBCURL_VERSION_NUM
  *host.String        ; OS/host/cpu/machine when configured
  features.l          ; bitmask, see defines below
  *ssl_version.String ; human readable string
  ssl_version_num.l   ; not used anymore, always 0
  *libz_version.String; human readable string
                      ; protocols is terminated by an entry With a NULL protoname
  *protocols.String
  ; The fields below this were added in CURLVERSION_SECOND
  *ares.String
  ares_num.l
  ; This field was added in CURLVERSION_THIRD
  *libidn.String;
                ; These field were added in CURLVERSION_FOURTH
                ; Same As '_libiconv_version' If built With HAVE_ICONV
  iconv_ver_num.l
  *libssh_version.String   ; human readable string
EndStructure

CompilerIf #PB_Compiler_OS = #PB_OS_Windows
  ImportC "libcurl.lib"   
    curl_easy_cleanup(handle.i)
    curl_easy_duphandle(handle.i) 
    curl_easy_getinfo(curl.i, info_type.i, info.i) 
    curl_easy_init() 
    curl_easy_perform(handle.i)
    curl_easy_reset(handle.i)
    curl_easy_setopt(handle.i, option.i, parameter.i)
    curl_easy_strerror(errornum.i) 
    curl_escape(url.i, length.i) 
    curl_formadd(firstitem.i, lastitem.i) 
    curl_formfree(form.i)
    curl_free(ptr.i) 
    curl_getdate(datestring.i, now.i) 
    curl_getenv(name.i) 
    curl_global_cleanup() 
    curl_global_init(flags.i) 
    curl_global_init_mem(flags.i, m.i, f.i, r.i, s.i, c.i) 
    curl_mprintf(format.i)
    curl_mfprintf(fd.i, format.i)
    curl_msprintf(buffer.i, format.i)
    curl_msnprintf(buffer.i, maxlength.i, format.i) 
    curl_mvprintf(format.i, args.i) 
    curl_mvfprintf(fd.i, format.i, args.i) 
    curl_mvsprintf(buffer.i, format.i, args.i) 
    curl_mvsnprintf(buffer.i, maxlength.i, format.i, args.i) 
    curl_maprintf(format.i)
    curl_mvaprintf(format.i, args.i) 
    curl_multi_add_handle(multi_handle.i, easy_handle.i) 
    curl_multi_cleanup(multi_handle.i) 
    curl_multi_fdset(multi_handle.i, read_fd_set.i, write_fd_set.i, exc_fd_set.i, max_fd.i) 
    curl_multi_info_read(multi_handle.i, msgs_in_queue.i) 
    curl_multi_init() 
    curl_multi_perform(multi_handle.i, running_handles.i) 
    curl_multi_remove_handle(multi_handle.i, easy_handle.i) 
    curl_multi_strerror(errornum.i) 
    curl_share_cleanup(share_handle.i) 
    curl_share_init() 
    curl_share_setopt(share.i, option.i, parameter.i) 
    curl_share_strerror(errornum.i) 
    curl_slist_append(slist.i, string.p-utf8) 
    curl_slist_free_all(slist.i) 
    curl_strequal(str1.i, str2.i) 
    curl_strnequal(str1.i, str2.i, len.i)
    curl_unescape(url.i, length.i) 
    curl_version() 
    curl_version_info(type.i) 
  EndImport
CompilerElse
  ImportC "-lcurl"   
    curl_easy_cleanup(handle.i)
    curl_easy_duphandle(handle.i) 
    curl_easy_getinfo(curl.i, info_type.i, info.i) 
    curl_easy_init() 
    curl_easy_perform(handle.i)
    curl_easy_reset(handle.i)
    curl_easy_setopt(handle.i, option.i, parameter.i)
    curl_easy_strerror(errornum.i) 
    curl_escape(url.i, length.i) 
    curl_formadd(firstitem.i, lastitem.i) 
    curl_formfree(form.i)
    curl_free(ptr.i) 
    curl_getdate(datestring.i, now.i) 
    curl_getenv(name.i) 
    curl_global_cleanup() 
    curl_global_init(flags.i) 
    curl_global_init_mem(flags.i, m.i, f.i, r.i, s.i, c.i) 
    curl_mprintf(format.i)
    curl_mfprintf(fd.i, format.i)
    curl_msprintf(buffer.i, format.i)
    curl_msnprintf(buffer.i, maxlength.i, format.i) 
    curl_mvprintf(format.i, args.i) 
    curl_mvfprintf(fd.i, format.i, args.i) 
    curl_mvsprintf(buffer.i, format.i, args.i) 
    curl_mvsnprintf(buffer.i, maxlength.i, format.i, args.i) 
    curl_maprintf(format.i)
    curl_mvaprintf(format.i, args.i) 
    curl_multi_add_handle(multi_handle.i, easy_handle.i) 
    curl_multi_cleanup(multi_handle.i) 
    curl_multi_fdset(multi_handle.i, read_fd_set.i, write_fd_set.i, exc_fd_set.i, max_fd.i) 
    curl_multi_info_read(multi_handle.i, msgs_in_queue.i) 
    curl_multi_init() 
    curl_multi_perform(multi_handle.i, running_handles.i) 
    curl_multi_remove_handle(multi_handle.i, easy_handle.i) 
    curl_multi_strerror(errornum.i) 
    curl_share_cleanup(share_handle.i) 
    curl_share_init() 
    curl_share_setopt(share.i, option.i, parameter.i) 
    curl_share_strerror(errornum.i) 
    curl_slist_append(slist.i, string.p-utf8) 
    curl_slist_free_all(slist.i) 
    curl_strequal(str1.i, str2.i) 
    curl_strnequal(str1.i, str2.i, len.i)
    curl_unescape(url.i, length.i) 
    curl_version() 
    curl_version_info(type.i) 
  EndImport
CompilerEndIf

CompilerIf #PB_Compiler_OS = #PB_OS_Windows
  ImportC "ws2_32.lib"
  EndImport
CompilerEndIf

ProcedureC  curlWriteData(*ptr, Size, NMemB, *Stream)
  ;retreives utf-8/ascii encoded data
  Protected SizeProper.i  = Size & 255
  Protected NMemBProper.i = NMemB
  Protected MyDataS.s
  Shared ReceivedData.s
  
  MyDataS = PeekS(*ptr, SizeProper * NMemBProper, #PB_UTF8)
  ReceivedData + MyDataS
  ProcedureReturn SizeProper * NMemBProper
EndProcedure

Procedure.s curlGetData()
  Shared ReceivedData.s
  Protected ReturnData.s
  
  ReturnData.s = ReceivedData.s
  ReceivedData.s = ""
  
  ProcedureReturn ReturnData.s
EndProcedure

Procedure.s str2curl(string.s)
  Protected *curlstring 
  If *curlstring : FreeMemory(*curlstring) : EndIf
  *curlstring = AllocateMemory(Len(string) + 1)
  PokeS(*curlstring,string,-1,#PB_Ascii)
  ProcedureReturn PeekS(*curlstring,-1)
EndProcedure
; IDE Options = PureBasic 5.40 LTS Beta 5 (Windows - x86)
; EnableUnicode
; EnableXP
; EnableBuildCount = 0