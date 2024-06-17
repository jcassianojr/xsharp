FUNCTION sdvarrcam(cLINHA,aCAMPOS,lCONV)
LOCAL X,aRETU,nFIELDS
nFIELDS:=Len(aCAMPOS)
aRETU:={}
FOR X := 1 TO nFIELDS
   AAdd(aRETU,sdvpegpos(cLINha,aCAMPOS,X,lCONV))
NEXT X
RETURN aRETU

FUNCTION sdvarrpos(aDBF,lESP)
 LOCAL nFIELDS,nPOS,aRETU,X
      nFIELDS:=Len(aDBF)
 IF ValType(LESP)#"L"
    lESP:=.F.
 ENDIF
 aRETU :={}
 nPOS:=1
 FOR X := 1 TO nFIELDS
     AAdd(aRETU,{aDBF[X][1],aDBF[X][2],aDBF[X][3],ADBF[X][4],nPOS,""})
     nPOS+=aDBF[X][3]+IF(lESP,1,0)
 NEXT X
 RETURN aRETU

FUNCTION sdvpegpos( Pstring,aCAMPOS, PnCampo,lCONV,eCONV )
 LOCAL eRETU
 eRetu := SubStr( Pstring, aCAMPOS[PnCampo][5], aCAMPOS[PnCampo][3] )
 IF ValType(lCONV)#"L"
    lCONV:=.F.
 ENDIF
 IF ValType(eCONV)#"C"
    eCONV:=aCAMPOS[PnCampo][6]
 ENDIF
 IF lCONV
    IF ! Empty(eCONV)
       DO CASE
          CASE eCONV="DMY/2" .or. eCONV="DMY/4"
               eRETU:=SubStr(eRETU,1,2)+"/"+SubStr(eRETU,3,2)+"/"+SubStr(eRETU,5)
       ENDCASE
    ELSE
    DO CASE
       CASE aCAMPOS[PnCampo][2]="SD"
            eRETU := SToD( eRETU )
       CASE aCAMPOS[PnCampo][2]="D"
            eRETU := CToD( eRETU )
       CASE aCAMPOS[PnCampo][2]="L"
            eRETU := IF(eRETU="S",.T.,.F.)
       CASE aCAMPOS[PnCampo][2]="N"
            eRETU := Val(eRETU)
            IF aCAMPOS[PnCampo][4]>0
               eRETU:=eRETU/(10^aCAMPOS[PnCampo][4])
            ENDIF
    ENDCASE
    ENDIF
 ENDIF
 RETURN eRETU




