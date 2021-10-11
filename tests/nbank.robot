*Settings*

Resource        ${EXECDIR}/resources/base.robot


Test Setup      Start Session
Test Teardown   End Session


*Test Cases*

Cenario 1: Saldo
    Should See Opening Balance

Cenario 2: Fazer PIX

    &{pix}      Create Dictionary

    ...         bank=Nubank
    ...         key=15984667711
    ...         value=900
    

    Do PIX Forms        ${pix}
    Do PIX Submit
    Do PIX Visible      ${pix}

Cenario 3: PIX com valor ZERO

    &{pix}      Create Dictionary

    ...         bank=Neon
    ...         key=15984667711
    ...         value=0
    

    Do PIX Forms        ${pix}
    Do PIX Submit
    Should Be Alert     Oops. Transferir ZERO é osso hein...


Cenario 4: PIX com valor NEGATIVO

    &{pix}      Create Dictionary

    ...         bank=Neon
    ...         key=-1
    ...         value=500
    

    Do PIX Forms        ${pix}
    Do PIX Submit
    Should Be Alert     "Oops. Valor para PIX incorreto..."