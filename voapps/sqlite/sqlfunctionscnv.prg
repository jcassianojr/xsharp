/*
TEXTBLOCK SQLite:sqlfunctionscnv
/-*

 {"LEFT(%1%,%2%)"			,"SUBSTR(%1%,1,%2%)"},;
                      {"LOWER(%1%)"			   ,"LOWER(%1%)"},;
                      {"UPPER(%1%)"			   ,"UPPER(%1%)"},;
                      {"DTOS(%1%)"				,"strftime('%Y%m%d',%1%)"},;
                      {"DAY(%1%)"				,"cast(strftime('%d',%1) as int)"},;
                      {"MONTH(%1%)"				,"cast(strftime('%m',%1) as int)"},;
                      {"YEAR(%1%)"				,"cast(strftime('%Y',%1) as int)"},;
                      {"TODAY()"					,"CURRENT_DATE"},;
                      {"CHR(%1%)"				,"CHAR(%1%)"},;
                      {"LEN(%1%)"				,"LENGTH(%1%)"},;
                      {"REPL(%1%,%2%)"			,"FORMAT('%.*c',%2%,%1%)"},;
                      {"ASC(%1%)"				,"ASCII(%1%)"},;
                      {"TRIM(%1%)"				,"RTRIM(%1%)"},;
                      {"ALLTRIM(%1%)"			,"TRIM(%1%)"},;
 *-/


*/
