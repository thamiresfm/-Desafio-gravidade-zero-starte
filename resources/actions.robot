*Settings*
Documentation               Ações customizadas do Nbank

*Keywords*

Should See Opening Balance
    Wait For Elements State         //div/a[contains(text(), "Olá Papito, seu saldo é R$ 1000")]        
    ...                             visible     5

Do PIX Forms   
    [Arguments]         ${pix}
    
    Click                           xpath=//a/strong[text()="Fazer PIX"]
    
    Select Options By               css=.select select          text                ${pix}[bank]    

    Fill Text                       id=chave-pix                ${pix}[key]
    Fill Text                       id=valor                    ${pix}[value]

Do PIX Submit
    Click                           xpath=//button[contains(text(),"Enviar PIX")]

Do PIX Visible
    [Arguments]         ${pix}

    ${element}          Set Variable         xpath=//td[contains(text(), "${pix}[key]")]/.. 

    Wait For Elements State      ${element}                     visible             5   
    Get Text                     ${element}                     contains             ${pix}[value]      

Should Be Alert
    [Arguments]         ${messenger}

    Get Text                     css=.media-content            contains             ${messenger}   