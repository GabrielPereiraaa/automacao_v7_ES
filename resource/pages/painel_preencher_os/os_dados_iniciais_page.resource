*** Settings ***
Resource    ../../../base.resource

*** Keywords ***
Preencher dados iniciais da Os
   [Documentation]    Preenche os dados da Ordem de Serviço (OS) aberta.

    # 1. Selecionar o cliente da Vistoria.
    Click    ${os_dados_iniciais.dropdown_selecionar_cliente_vistoria}
    Wait Until Element Exist    ${os_dados_iniciais.dropdown_opcao_particular}   retries=${TIMEOUT}
    Click    ${os_dados_iniciais.dropdown_opcao_particular}

    # 2. Selecionar forma de pagamento.
    Click    ${os_dados_iniciais.dropdown_selecionar_forma_pagamento}
    Wait Until Element Exist    ${os_dados_iniciais.dropdown_opcao_a_vista}    retries=${TIMEOUT}
    Click    ${os_dados_iniciais.dropdown_opcao_a_vista}

    # 3. Selecionar UF do veiculo.
    Click    ${os_dados_iniciais.dropdown_uf}
    Wait Until Element Exist    ${os_dados_iniciais.dropdown_opcao_bahia}    retries=${TIMEOUT}
    Click    ${os_dados_iniciais.dropdown_opcao_bahia}

    # 4. Selecionar Serviços(BA)
    Click    ${os_dados_iniciais.selecionar_servico_ba}

    # 5. Salvar as informações da Os
    Click    ${os_dados_iniciais.botao_salvar_informacoes_iniciais}

    # 6. Se aparecer o pop-up de histórico, clicar em sim
    # Usamos um locator para o título do pop-up para a verificação.
    Sleep    2s    # Aguarda um pouco para o pop-up aparecer
    ${locator_popup_historico}    Set Variable    ${os_dados_iniciais.popup_historico_os}
    ${popup_apareceu}=    Run Keyword And Return Status    Wait Until Element Exist    ${locator_popup_historico}    retries=${TIMEOUT}

    # A variável ${popup_apareceu} será True se o pop-up aparecer, ou False se não aparecer.
    IF    ${popup_apareceu} == True
        # Se a condição for verdadeira, executa o que está aqui dentro.
        Log      Pop-up de histórico encontrado. Clicando em 'Sim'.
        Click    ${os_dados_iniciais.popup_botao_sim}
    ELSE
        # Se a condição for falsa, executa o que está aqui.
        Log      Pop-up de histórico não apareceu, continuando o teste.

    END