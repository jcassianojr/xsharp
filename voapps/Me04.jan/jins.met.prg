PARTIAL CLASS JINS
METHOD escPF( ) 
LOCAL oJAN AS XJPFDIA
oJAN:=XJPFDIA{SELF}
oJAN:SHOW()
IF oJAN:lOK
   SELF:SERVER:FIELDPUT("PF",oJAN:NPF)
 // SELF:oDCPF:TextValue:=Str(oJAN:NPF)
ENDIF	
	

METHOD TABAPL 
//ESCAPL nao grava dbf	
RETU MTD02("APLINS",30)

METHOD TABINS 
//CODTIPO	
RETU MTD02("TIPINS",3)

METHOD TABMAR 
//MARCA
RETU MTD02("MARINS",20)

METHOD TABSIT 
//SITUACAO	
RETU MTD02("SITINS",1)

METHOD TABTCA 
//TIPCAL	
RETU MTD02("TCAINS",1)

METHOD TABTPC 
//CADTIP	
RETU MTD02("TPCINS",1)


END CLASS
