FUNCTION cep2uf(cepuso)
LOCAL cep2uf
cepuso:=TIRAOUT(cepuso)
cepuso:=Val(cepuso)
cep2uf:="EX"
DO CASE
    CASE cepuso>=01000000  .and. cepuso<=19999999
        cep2uf:="SP"
    CASE cepuso>=20000000  .and. cepuso<=28999999
        cep2uf:="RJ"
    CASE cepuso>=29000000  .and. cepuso<=29999999
      cep2uf:="ES"
    CASE cepuso>=30000000  .and. cepuso<=39999999
        cep2uf:="MG"
    CASE cepuso>=40000000  .and. cepuso<=48999999
        cep2uf:="BA"
    CASE cepuso>=49000000  .and. cepuso<=49999999
         cep2uf:="SE"
    CASE cepuso>=50000000  .and. cepuso<=56999999
         cep2uf:="PE"
    CASE cepuso>=57000000  .and. cepuso<=57999999
         cep2uf:="AL"
    CASE cepuso>=58000000  .and. cepuso<=58999999
         cep2uf:="PB"
    CASE cepuso>=59000000  .and. cepuso<=59999999
         cep2uf:="RN"
    CASE cepuso>=60000000  .and. cepuso<=63999999
         cep2uf:="CE"
    CASE cepuso>=64000000  .and. cepuso<=64999999
         cep2uf:="PI"
    CASE cepuso>=65000000  .and. cepuso<=65999999
         cep2uf:="MA"
    CASE cepuso>=66000000  .and. cepuso<=68899999
         cep2uf:="PA"
    CASE cepuso>=68900000  .and. cepuso<=68999999
         cep2uf:="AP"
    CASE cepuso>=69000000  .and. cepuso<=69299999
         cep2uf:="AM" //1a faixa amazonas
    CASE cepuso>=69300000  .and. cepuso<=69399999
         cep2uf:="RR"
    CASE cepuso>=69400000  .and. cepuso<=69899999
         cep2uf:="AM" //2a faixa amazonas
    CASE cepuso>=69900000  .and. cepuso<=69999999
         cep2uf:="AC"
    CASE cepuso>=70000000  .and. cepuso<=72799999
         cep2uf:="DF"  //1a Faixa Distrito Federal
    CASE cepuso>=72800000  .and. cepuso<=72999999
         cep2uf:="GO" //1a faixa de Goias
    CASE cepuso>=73000000  .and. cepuso<=73699999
         cep2uf:="DF" //2a. faixa distrito federal
    CASE cepuso>=73700000  .and. cepuso<=76799999
         cep2uf:="GO" //2a; faixa de Goias
    CASE cepuso>=77000000  .and. cepuso<=77999999
         cep2uf:="TO"
    CASE cepuso>=78000000  .and. cepuso<=78899999
         cep2uf:="MT"
    CASE cepuso>=78900000  .and. cepuso<=78999999
         cep2uf:="RO"
    CASE cepuso>=79000000  .and. cepuso<=79999999
         cep2uf:="MS"
    CASE cepuso>=80000000  .and. cepuso<=87999999
         cep2uf:="PR"
    CASE cepuso>=88000000  .and. cepuso<=89999999
         cep2uf:="SC"
    CASE cepuso>=90000000  .and. cepuso<=99999999
          cep2uf:="RS"
   OTHERWISE
      cep2uf:="EX"
ENDCASE
RETU cep2uf


