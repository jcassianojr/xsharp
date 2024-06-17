FUNC ADDANO(dDataIni AS DATE, nAnos AS INT) AS DATE STRICT
LOCAL nDIA:=Day(dDataIni),nMES:=Month(dDataIni),nANO:=Year(dDataIni)
RETU CToD(StrZero(nDIA,2)+"/"+StrZero(nMES,2)+"/"+StrZero(nANO+nANOS,4))


FUNC ADDMES(dDataIni AS DATE, nMeses AS INT) AS DATE STRICT
LOCAL X,nDIA:=Day(dDATAINI),nMES:=Month(dDATAINI),nANO:=Year(dDATAINI),mVENCIMENTO
mVENCIMENTO:=Today()
IF ! Empty(dDATAINI) .AND. ! Empty(nMESES)
	FOR X := 1 TO nMESES
	    nMES++
	NEXT X
	WHILE nMES>12
	   nMES-=12
	   nANO++
	ENDDO
	IF nMES=2
	    IF nDIA>28
	       nDIA:=28
	    ENDIF
	ENDIF
	mVENCIMENTO:=CToD(StrZero(nDIA,2)+"/"+StrZero(nMES,2)+"/"+StrZero(nANO,4))
ENDIF
RETU mVENCIMENTO
FUNCTION BackMonths(dInDate AS DATE, nMonths AS INT) AS DATE STRICT

	LOCAL nN AS INT
	LOCAL lIsLastDay AS LOGIC
	LOCAL dResult, dCurrent AS DATE
	// gcs 24/02/00
	// This routine transcends yearly/monthly boundaries correctly
	
	IF Empty(dIndate)
		RETURN NULL_DATE
	ENDIF
	
	dResult := dIndate
	lIsLastDay := (Month(dResult) <> Month(dResult+1))

	FOR nN := 1 UPTO nMonths
		dCurrent := dResult
		IF lIsLastDay
			// Last day of the month. Just cycle until the month changes
			DO WHILE Month(dResult) = Month(dCurrent)
				dResult -= 1
			ENDDO
		ELSE
			dResult -= 1	// go back one day to start the loop
			// Feb is the only difficulty if 29th or 30th chosen Jan, Mar, May, Jul, Oct, Dec
			DO WHILE (Day(dResult) <> Day(dInDate))  .or. (Day(dInDate)>28  .and. Month(dResult)=2)
				dResult--
			ENDDO
		ENDIF
	NEXT

	RETURN dResult

FUNCTION BackYears(dInDate AS DATE, nYears AS INT) AS DATE STRICT

	LOCAL nThisYear AS INT
	LOCAL cDayMth AS STRING
	
	nThisYear := Val(Right(DToC(dIndate), 4)) - nYears
	cDayMth   := Left(DToC(dInDate), 6)
	
	// this may fail if you pick 29 Feb so do some more checking
	IF cDayMth = "29/02/"
		IF ! IsLeapYear(nThisYear)
			cDayMth := "28/02/"
		ENDIF
	ENDIF
	
	RETURN CToD(cDayMth+NTrim(nThisYear-nYears))

FUNC BHOR(QTHOR)
LOCAL QT1,QT2,QT3 AS FLOAT
QT1:=INT(QTHOR)
QT2:=QTHOR-QT1
QT3:=Round(QT2*6/10,2)
RETU(QT1+QT3)


FUNC CHOR(QTHOR)
LOCAL QT1,QT2,QT3 AS FLOAT
QT1:=Floor(QTHOR)
QT2:=QTHOR-QT1
QT3:=QT2*10/6
RETU(QT1+QT3)

FUNC Ddia(ndia)
LOCAL aDIA	
IF IsDate(nDIA)
   nDIA:=DoW(nDIA)
ENDIF	
aDIA:={"Domingo","Segunda","Terça","Quarta","Quinta","Sexta","Sábado"}
IF ndia<1  .OR. ndia>7
   RETU "Erro DIA"
ENDIF
RETU(aDIA[nDIA])

FUNCTION FirstDayofMonth( dDate AS DATE ) AS DATE

	LOCAL wYear	AS DWORD
	LOCAL wMonth AS DWORD

	wYear	:= Year( dDate )
	wMonth	:= Month( dDate )

	// format the output
	RETURN  ConDate( wYear, wMonth, 1 )



FUNCTION ForwardMonths(dInDate AS DATE, nMonths AS INT) AS DATE STRICT

	LOCAL nN AS INT
	LOCAL lIsLastDay AS LOGIC
	LOCAL dResult AS DATE
	// gcs 22/09/00
	// This routine transcends yearly/monthly boundaries correctly
	
	

	IF Empty(dIndate)
		RETURN NULL_DATE
	ENDIF
	
	dResult := dIndate
	lIsLastDay := (Month(dResult) <> Month(dResult+1))

	FOR nN := 1 UPTO nMonths
	//	dCurrent := dResult
		dResult += 1
		IF lIsLastDay
			// we are now in the next month so just go to last day
			DO WHILE Month(dResult) = Month(dResult+1)
				dResult += 1
			ENDDO
		ELSE
			// Feb is the only difficulty if 29th or 30th chosen Jan, Mar, May, Jul, Oct, Dec
			DO WHILE (Day(dResult) <> Day(dInDate))  .or. (Day(dInDate)>28  .and. Month(dResult)=2)
				dResult += 1
			ENDDO
		ENDIF
	NEXT

	RETURN dResult

FUNCTION ForwardYears(dInDate AS DATE, nYears AS INT) AS DATE STRICT

	LOCAL nThisYear AS INT
	
	nThisYear := Val(Right(DToC(dIndate), 4))
	
	RETURN CToD(Left(DToC(dInDate), 6)+NTrim(nThisYear+nYears))


//FUNCTION IsLeapYear( dwYear ) AS LOGIC   //NATIVA
//	RETURN iif( ( dwYear % 4 == 0)  .and. !(dwYear % 100 == 0)  .or. ( dwYear % 400 == 0 ), TRUE, FALSE )


FUNCTION LastDayofMonth( dDate AS DATE ) AS DATE

	LOCAL wMonth AS DWORD

	wMonth := Month( dDate )

	// halts in this month	
	DO WHILE Month(dDate+1) = wMonth
		dDate += 1
	ENDDO

	RETURN dDate

FUNC MESSTR(nMES AS DWORD,nANO AS DWORD,nTIP AS BYTE,nTIP2 AS BYTE) AS STRING
LOCAL cRETU:=""
DO CASE
   CASE nMES=1 ;  cRETU:=IF(nTIP2=1,"Jan","Janeiro")
   CASE nMES=2 ;  cRETU:=IF(nTIP2=1,"Fev","Fevereiro")
   CASE nMES=3 ;  cRETU:=IF(nTIP2=1,"Mar","Marco")
   CASE nMES=4 ;  cRETU:=IF(nTIP2=1,"Abr","Abril")
   CASE nMES=5 ;  cRETU:=IF(nTIP2=1,"Mai","Maio")
   CASE nMES=6 ;  cRETU:=IF(nTIP2=1,"Jun","Junho")
   CASE nMES=7 ;  cRETU:=IF(nTIP2=1,"Jul","Julho")
   CASE nMES=8 ;  cRETU:=IF(nTIP2=1,"Ago","Agosto")
   CASE nMES=9 ;  cRETU:=IF(nTIP2=1,"Set","Setembro")
   CASE nMES=10 ;  cRETU:=IF(nTIP2=1,"Out","Outubro")
   CASE nMES=11 ;  cRETU:=IF(nTIP2=1,"Nov","Novembro")
   CASE nMES=12 ;  cRETU:=IF(nTIP2=1,"Dez","Dezembro")
   OTHERWISE ;  cRETU:="???"
ENDCASE
DO CASE
   CASE nTIP=1  ;     cRETU+="/"+StrZero(nANO,4)
   CASE nTIP=2  ;     cRETU+="/"+Right(StrZero(nANO,4)  ,2)
ENDCASE
RETU cRETU


