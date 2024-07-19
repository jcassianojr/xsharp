_dll function hs_regcomp( strRegEx as _RegExStruct, pszPattern as psz, nCFlags as int ) as int pascal:hs_regex.regcomp 
//     int regcomp(regex_t *preg, const char *pattern, int cflags);

_dll function hs_regerror( nErrCode as int, strRegEx as _RegExStruct, ptrErrBuf as ptr, nErrBufSize as int ) as int pascal:hs_regex.regerror
//     size_t regerror(int errcode, const regex_t *preg, char *errbuf, size_t errbuf_size);

_dll function hs_regexec( strRegEx as _RegExStruct, pszString as psz, nMatch as int, ptrPmatch as ptr, nEFlags as int ) as int pascal:hs_regex.regexec 
//      int regexec(const regex_t *preg, const char *string, size_t nmatch, regmatch_t pmatch[], int eflags);

_dll function hs_regfree( strRegEx as _RegExStruct ) as void pascal:hs_regex.regfree
//     void regfree(regex_t *preg);


