*** Settings ***
Resource    ../../base.resource

*** Keywords ***
# KEYWORD REUTILIZÁVEL PARA SALVAR E CONFIRMAR
Salvar OS e Confirmar Sucesso
    [Documentation]    Salva a OS e confirma a mensagem de sucesso.
    
    # Clica no botão Finalizar OS
    Click    ${os_painel.botao_finalizar_os}
    
    # Aguarda e confirma a mensagem de sucesso
    Wait Until Element Exist    ${os_painel.popup_sucesso_texto}    retries=${TIMEOUT}
    Click    ${os_painel.popup_sucesso_botao_ok}    retries=${TIMEOUT}

Integrar o laudo
    [Documentation]    Salva a OS e confirma a mensagem de sucesso.

    # Clica no botão Integrar Laudo
    Click    ${os_painel.botao_integrar_laudo}

    # Aguarda e confirma a mensagem de sucesso
    Wait Until Element Exist    ${os_painel.popup_integracao_texto}    retries=${TIMEOUT}
    Click    ${os_painel.popup_integracao_botao_sim}    retries=${TIMEOUT}