﻿PARTIAL CLASS XINDEXAR INHERIT INDEXAR	

METHOD PushButton1() 
SELF:POINTER:=POINTER{POINTERHOURGLASS}
//Controle Salt-Spray
CRIANTX({ZCURINI,"CRMSS.DBF",ZCURDIR})
//Controle AR/CRM/RIRM/RIST
CRIANTX({ZCURINI,"CRMAR.DBF",ZCURDIR})
//Autorizacao
CRIANTX({ZCURINI,"AUT.DBF",ZCURDIR})
//controle carga excedente
CRIANTX({ZCURINI,"CRGEX.DBF",ZCURDIR})
//controle carga CORTE
CRIANTX({ZCURINI,"CRGEC.DBF",ZCURDIR})
//crm
CRIANTX({ZCURINI,"CRM.DBF",ZCURDIR})
//controle de lote
CRIANTX({ZCURINI,"CRML.DBF",ZCURDIR})
//controle de rastro
CRIANTX({ZCURINI,"CRMR.DBF",ZCURDIR})
//controle de rastro alternativo
CRIANTX({ZCURINI,"CRMA.DBF",ZCURDIR})
//Controle de rastro motivo
CRIANTX({ZCURINI,"CRMMOT.DBF",ZCURDIR})
//Controle de Rastro Crm/Final
CRIANTX({ZCURINI,"CRMFN.DBF",ZCURDIR})
//Ultima nota fiscal
CRIANTX({ZCURINI,"CRMNF.DBF",ZCURDIR})
//rirm
CRIANTX({ZCURINI,"RIRM.DBF",ZCURDIR})
CRIANTX({ZCURINI,"RIRMI.DBF",ZCURDIR})
//rist
CRIANTX({ZCURINI,"RIST.DBF",ZCURDIR})
CRIANTX({ZCURINI,"RISTI.DBF",ZCURDIR})
//codigos ensaios
CRIANTX({ZCURINI,"CRMENS.DBF",ZCURDIR})
//controle de rastro estque
CRIANTX({ZCURINI,"CRMEST.DBF",ZCURDIR})
CRIANTX({ZCURINI,"CRMEBX.DBF",ZCURDIR})
//GP12_3L(Racf)
CRIANTX({ZCURINI,"CRMGP12.DBF",ZCURDIR})
CRIANTX({ZCURINI,"CRM3L.DBF",ZCURDIR})
//Ensaios Conforme Certificacao
CRIANTX({ZCURINI,"MP01R.DBF",ZCURDIR})
CRIANTX({ZCURINI,"MP02R.DBF",ZCURDIR})
CRIANTX({ZCURINI,"MP03R.DBF",ZCURDIR})
CRIANTX({ZCURINI,"MQ01R.DBF",ZCURDIR})
CRIANTX({ZCURINI,"MR01R.DBF",ZCURDIR})
CRIANTX({ZCURINI,"MS01R.DBF",ZCURDIR})
CRIANTX({ZCURINI,"MT01R.DBF",ZCURDIR})
CRIANTX({ZCURINI,"MU01R.DBF",ZCURDIR})
//Ensaios Normais
CRIANTX({ZCURINI,"MP01I.DBF",ZCURDIR})
CRIANTX({ZCURINI,"MP02I.DBF",ZCURDIR})
CRIANTX({ZCURINI,"MP03I.DBF",ZCURDIR})
CRIANTX({ZCURINI,"MQ01I.DBF",ZCURDIR})
CRIANTX({ZCURINI,"MR01I.DBF",ZCURDIR})
CRIANTX({ZCURINI,"MS01I.DBF",ZCURDIR})
CRIANTX({ZCURINI,"MT01I.DBF",ZCURDIR})
CRIANTX({ZCURINI,"MU01I.DBF",ZCURDIR})

//
CRIANTX({ZCURINI,"crmcesp.DBF",ZCURDIR})
CRIANTX({ZCURINI,"crmdev.DBF",ZCURDIR})

//CRME01 CRME02 CRME03 Etiquetas sem index

GRAVALOG("INDEXAR","CDX","CDX")	
SELF:POINTER:=POINTER{}
SELF:ENDWINDOW()


END CLASS
