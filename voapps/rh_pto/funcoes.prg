FUNCTION escolalogix(nGRAU)
LOCAL cESCOLA AS STRING
cESCola:=""

         	DO CASE
         	   CASE nGRAU=1	
         	   	    cESCOLA:="01" //"10" //ANA

         	   CASE nGRAU=2	
         	   	    cESCOLA:="02" //"20" //1A4 INC

         	   CASE nGRAU=3	
         	   	    cESCOLA:="03" //"25" //1A4 COM

         	   CASE nGRAU=4	
         	   	    cESCOLA:="04" //"30" //5A8 INC

         	   CASE nGRAU=5	
         	   	    cESCOLA:="05" //"35" //5A8 COM

         	   CASE nGRAU=6	
         	   	    cESCOLA:="06" //"40" //2 grau inc

         	   CASE nGRAU=7	
         	   	    cESCOLA:="07" //"45" //2 grau com

         	   CASE nGRAU=8	
         	   	    cESCOLA:="08" //"50" //sup inc

         	   CASE nGRAU=9	
         	   	    cESCOLA:="09" //"55" //sup com

         	   CASE nGRAU=11
         	   	    cESCOLA:="11" //"65" //mestrado

         	   CASE nGRAU=12
         	   	    cESCOLA:="12" //"75" //doutorado

         	ENDCASE	
RETURN cESCOLA





