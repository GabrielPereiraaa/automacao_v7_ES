*** Settings ***
Resource    ../../../base.resource

*** Keywords ***
Preencher dados do proprietário
    [Documentation]    Preenche os dados do proprietário na Ordem de Serviço (OS).

    # 1. Clica na aba Dados do Proprietário.
    Wait Until Element Exist    ${os_dados_proprietario.aba_proprietario}    retries=${TIMEOUT}
    Click    ${os_dados_proprietario.aba_proprietario}    retries=${TIMEOUT}

    # 2. Selecionar se é pessoa fisica ou juridica.
    Click    ${os_dados_proprietario.dropdown_selecionar_tipo_pessoa}
    Wait Until Element Exist    ${os_dados_proprietario.dropdown_opcao_fisica}   retries=${TIMEOUT}
    Click    ${os_dados_proprietario.dropdown_opcao_fisica}

    # 3. Preenche os dados do proprietário.
    Click    ${os_dados_proprietario.campo_cpf_ou_cnpj}    # Clica no campo CPF/CNPJ para garantir o foco
    Press Keys    ${CNPJ_SEQUENCE}    ${os_dados_proprietario.campo_cpf_ou_cnpj}     # CPF/CNPJ
    Set Text To Textbox    ${os_dados_proprietario.campo_rg}    ${informacoes_vistoria.proprietario.rg}    # RG
    Set Text To Textbox    ${os_dados_proprietario.campo_nome_ou_razao_social}     ${informacoes_vistoria.proprietario.nome_ou_razao_social}    # Nome completo ou Razão Social
    # Set Text To Textbox    ${os_dados_proprietario.campo_dd}   ${informacoes_vistoria.proprietario.dd}    # dd
    # Set Text To Textbox    ${os_dados_proprietario.campo_telefone}     ${informacoes_vistoria.proprietario.telefone}    # telefone
    # Click    ${os_dados_proprietario.campo_cep}    # Clica no campo CEP para garantir o foco              ---Desnecessario em ES
    # Press Keys    ${CEP_SEQUENCE}    ${os_dados_proprietario.campo_cep}     # CEP
    # Set Text To Textbox    ${os_dados_proprietario.campo_endereco}     ${informacoes_vistoria.proprietario.endereco}    # endereço
    # Set Text To Textbox    ${os_dados_proprietario.campo_numero}    ${informacoes_vistoria.proprietario.endereco_numero}   # numero              ---Desnecessario em ES

    # 4. Preenche os dados do interessado.
    Click    ${os_dados_proprietario.dropdown_interessado}    # Clica no dropdown para garantir o foco
    Wait Until Element Exist    ${os_dados_proprietario.dropdown_opcao_interessado}   retries=${TIMEOUT}    # Espera o dropdown aparecer
    Click    ${os_dados_proprietario.dropdown_opcao_interessado}    # Seleciona a opção "Despachante" no dropdown
    Click    ${os_dados_proprietario.input_cpf_interessado}    # Clica no campo CPF do interessado para garantir o foco
    Press Keys    ${CPF_SEQUENCE}    ${os_dados_proprietario.input_cpf_interessado}     # CPF do interessado
    Click    ${os_dados_proprietario.input_num_interessado}    # Clica no campo Número do interessado para garantir o foco
    Press Keys    ${NUM_SEQUENCE}    ${os_dados_proprietario.input_num_interessado}     # Número do interessado
    Set Text To Textbox    ${os_dados_proprietario.campo_nome_interessado}    ${informacoes_vistoria.interessado.nome}    # Nome do interessado

    # #  . Selecionar baixo e municipio.
    # #Municipio
    # Click    ${os_dados_proprietario.dropdown_selecionar_municipio}
    # Wait Until Element Exist    ${os_dados_proprietario.dropdown_opcao_municipio}   retries=${TIMEOUT}              ---Desnecessario em ES
    # Click    ${os_dados_proprietario.dropdown_opcao_municipio}

    # # Bairro
    # Click    ${os_dados_proprietario.dropdown_selecionar_bairro}
    # Wait Until Element Exist    ${os_dados_proprietario.dropdown_opcao_bairro}   retries=${TIMEOUT}              ---Desnecessario em ES
    # Click    ${os_dados_proprietario.dropdown_opcao_bairro}

    # 4. Salva os dados do proprietário.
    Salvar OS e Confirmar Sucesso