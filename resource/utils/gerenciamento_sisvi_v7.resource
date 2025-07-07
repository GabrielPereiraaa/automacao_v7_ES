*** Settings ***
Resource    ../../base.resource


*** Keywords ***
Abrir o Sisvi V7
    [Documentation]    Inicia a aplicação Sisvi V7 e armazena o PID.

    ${pid}=    Launch Application    ${sisvi_v7.app_path}
    Set Suite Variable    ${sisvi_v7.app_pid}    ${pid}
    Log    PID da aplicação: ${sisvi_v7.app_pid}
    # Sleep    3s
    Wait Until Element Exist    //Pane[@AutomationId='pbLogoOxxy']   retries=${TIMEOUT}


Fechar o Sisvi V7
    [Documentation]    Fecha a aplicação Sisi.
    Sleep    time_=5s
    Take Screenshot
    # Close Application    ${sisvi_v7.app_pid}