*** Settings ***
Resource    ../../../base.resource

*** Keywords ***
Preencher dados iniciais da Os
   [Documentation]    Preenche os dados da Ordem de Serviço (OS) aberta.

    # 1. Inserir Renavam
    Set Text To Textbox    ${os_dados_iniciais.campo_renavam}    ${informacoes_vistoria.informacoes_veiculo.renavam}

    # # 2 Selecionar vistoriador.
    # Click    ${os_dados_iniciais.dropdown_vistoriador}    ---Desnecessario em ES
    # Wait Until Element Exist    ${os_dados_iniciais.dropdown_opcao_vistoriador}    retries=${TIMEOUT}
    # Click    ${os_dados_iniciais.dropdown_opcao_vistoriador}

    # 3. Selecionar o cliente da Vistoria.
    Click    ${os_dados_iniciais.dropdown_selecionar_cliente_vistoria}
    Wait Until Element Exist    ${os_dados_iniciais.dropdown_opcao_cliente}   retries=${TIMEOUT}
    Click    ${os_dados_iniciais.dropdown_opcao_cliente}

    # 4. Selecionar forma de pagamento.
    Click    ${os_dados_iniciais.dropdown_selecionar_forma_pagamento}
    Wait Until Element Exist    ${os_dados_iniciais.dropdown_opcao_a_vista}    retries=${TIMEOUT}
    Click    ${os_dados_iniciais.dropdown_opcao_a_vista}

    # # 5. Selecionar caixa.
    # Click    ${os_dados_iniciais.dropdown_caixa}
    # Wait Until Element Exist    ${os_dados_iniciais.dropdown_opcao_caixa}    ---Desnecessario em ES
    # Click    ${os_dados_iniciais.dropdown_opcao_caixa}

    # # 4.1 Selecionar UF do veiculo.
    # Click    ${os_dados_iniciais.dropdown_uf}    ---Desnecessario em ES
    # Wait Until Element Exist    ${os_dados_iniciais.dropdown_opcao_paraiba}    retries=${TIMEOUT}
    # Click    ${os_dados_iniciais.dropdown_opcao_paraiba}

    # # 5. Selecionar Serviços(BA)
    # Click    ${os_dados_iniciais.selecionar_servico_ba}    ---Desnecessario em ES

    # 6. Salvar as informações da Os
    Click    ${os_dados_iniciais.botao_salvar_informacoes_iniciais}

    # 7. Se aparecer o pop-up de histórico, clicar em sim
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

    # # 8. Pop up erro veiculo nao encontrado
    # Wait Until Element Exist    ${os_dados_iniciais.botao_erro}    retries=${TIMEOUT}    ---Desnecessario em ES
    # Click    ${os_dados_iniciais.botao_erro}    # Fecha o pop-up de erro se aparecer

    # # 9. Confirmar abertura da OS
    #  Wait Until Element Exist    ${os_dados_iniciais.botao_erro}    retries=${TIMEOUT}    ---Desnecessario em ES
    # Click    ${os_dados_iniciais.botao_erro}     #clica ok para abertura da OS

    # # 10. Consulta Bin
    # Wait Until Element Exist    ${os_dados_iniciais.botao_bin}    retries=${TIMEOUT}
    # Click    ${os_dados_iniciais.botao_bin}    #clica para consultar do bin
    # Wait Until Element Exist    ${os_dados_iniciais.botao_erro}    retries=${TIMEOUT}    ---Desnecessario em ES
    # Click    ${os_dados_iniciais.botao_erro}    #clica ok para confirmacao de consulta bin