*** Settings ***
Resource    ../../../base.resource

*** Keywords ***
Preencher dados complementares
    [Documentation]    Preenche os dados complementares na Ordem de Serviço (OS).

    # 1. Clica na aba Dados Complementares.
    Wait Until Element Exist    ${os_dados_complementares.aba_dados_complementares}    retries=${TIMEOUT}
    Click    ${os_dados_complementares.aba_dados_complementares}    retries=${TIMEOUT}

    # 2. Seleciona o Destino de Transferência.

    # Estado
    Click    ${os_dados_complementares.dropdown_selecionar_estado}
    Wait Until Element Exist    ${os_dados_complementares.dropdown_opcao_bahia}    retries=${TIMEOUT}
    Click    ${os_dados_complementares.dropdown_opcao_bahia}

    # Município
    Click    ${os_dados_complementares.dropdown_selecionar_municipio}
    Wait Until Element Exist    ${os_dados_complementares.dropdown_opcao_municipio}    retries=${TIMEOUT}
    Click    ${os_dados_complementares.dropdown_opcao_municipio}

    # 3. Preenche os dados complementares.
    Set Text To Textbox    ${os_dados_complementares.kilometragem}    0   # Kilometragem

    # # 4. Seleciona Para quem a nota fiscal será emitida.
    # Click    ${os_dados_complementares.dropdown_selecionar_destino_nota_fiscal}        ---Desnecessario em ES
    # Wait Until Element Exist    ${os_dados_complementares.dropdown_opcao_ordem_servico}    retries=${TIMEOUT}
    # Click    ${os_dados_complementares.dropdown_opcao_ordem_servico}

    # # 5. Troca de placa.
    # Click    ${os_dados_complementares.dropdown_troca_placa}        ---Desnecessario em ES
    # Wait Until Element Exist    ${os_dados_complementares.dropdown_opcao_nao}    retries=${TIMEOUT}
    # Click    ${os_dados_complementares.dropdown_opcao_nao}

    # 5. Salvar os dados complementares.
    Salvar OS e Confirmar Sucesso

    Integrar o laudo
