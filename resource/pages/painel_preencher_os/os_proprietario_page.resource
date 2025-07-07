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
    Press Keys    ${CPF_SEQUENCE}    ${os_dados_proprietario.campo_cpf_ou_cnpj}     # CPF/CNPJ
    Set Text To Textbox    ${os_dados_proprietario.campo_rg}    ${informacoes_vistoria.proprietario.rg}    # RG
    Set Text To Textbox    ${os_dados_proprietario.campo_nome_ou_razao_social}     ${informacoes_vistoria.proprietario.nome_ou_razao_social}    # Nome completo ou Razão Social
    Set Text To Textbox    ${os_dados_proprietario.campo_dd}   ${informacoes_vistoria.proprietario.dd}    # dd
    Set Text To Textbox    ${os_dados_proprietario.campo_telefone}     ${informacoes_vistoria.proprietario.telefone}    # telefone
    Click    ${os_dados_proprietario.campo_cep}    # Clica no campo CEP para garantir o foco
    Press Keys    ${CEP_SEQUENCE}    ${os_dados_proprietario.campo_cep}     # CEP
    Set Text To Textbox    ${os_dados_proprietario.campo_endereco}     ${informacoes_vistoria.proprietario.endereco}    # endereço
    Set Text To Textbox    ${os_dados_proprietario.campo_numero}    ${informacoes_vistoria.proprietario.endereco_numero}   # numero

    # 3 . Selecionar baixo e municipio.
    #Municipio
    Click    ${os_dados_proprietario.dropdown_selecionar_municipio}
    Wait Until Element Exist    ${os_dados_proprietario.dropdown_opcao_municipio}   retries=${TIMEOUT}
    Click    ${os_dados_proprietario.dropdown_opcao_municipio}

    # Bairro
    Click    ${os_dados_proprietario.dropdown_selecionar_bairro}
    Wait Until Element Exist    ${os_dados_proprietario.dropdown_opcao_bairro}   retries=${TIMEOUT}
    Click    ${os_dados_proprietario.dropdown_opcao_bairro}

    # 4. Salva os dados do proprietário.
    Salvar OS e Confirmar Sucesso