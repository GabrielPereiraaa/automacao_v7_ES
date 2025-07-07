*** Settings ***
Resource    ../../base.resource

*** Keywords ***
Abrir uma Os
    [Documentation]    Abre uma Ordem de Serviço (OS) com os dados fornecidos.    

    # Armazena a placa como variável de suite para uso posterior
    Set Suite Variable    ${PLACA_ATUAL}    ${informacoes_vistoria.informacoes_veiculo.placa}

    # 1. Clica no botão abrir a Ordem de Serviço
    Click    ${painel_principal.botao_abrir_ordem_servico}

    # 2. Selecionar a Panorâmica
    Click    ${painel_abrir_os.dropdown_panoramica}   retries=${TIMEOUT}
    Wait Until Element Exist    ${painel_abrir_os.selecionar_box1}
    Click    ${painel_abrir_os.selecionar_box1}

    # 3. Selecionar o tipo de abertura de Os.
    Click  ${painel_abrir_os.dropdown_tipo_de_abertura_os}
    Wait Until Element Exist    ${painel_abrir_os.selecionar_placa}
    Click  ${painel_abrir_os.selecionar_placa}

    # 4. Preenche a placa.
    Click         ${painel_abrir_os.input_placa}
    Set Text To Textbox    ${painel_abrir_os.input_placa}    ${informacoes_vistoria.informacoes_veiculo.placa}

    # 5. Espera o campo de renavan e preenche o renavan.
    Wait Until Element Is Enabled    ${painel_abrir_os.input_renavam}     retries=${TIMEOUT}
    Set Text To Textbox    ${painel_abrir_os.input_renavam}    ${informacoes_vistoria.informacoes_veiculo.renavam}

    # 6. Selecionar o vistoriador.
    Click    ${painel_abrir_os.dropdown_selecionar_vistoriador}
    Wait Until Element Exist    ${painel_abrir_os.nome_vistoriador}
    Click    ${painel_abrir_os.nome_vistoriador}

    # 7. Clica no botão para abrir a OS.
    Click    ${painel_abrir_os.botao_abrir_ordem_servico}

    # 8. Confirmação dos dados de abertura.
    Wait Until Element Exist    ${painel_abrir_os.popup_confirmar_abrir_os}    retries=${TIMEOUT}
    Click    ${painel_abrir_os.popup_botao_confirmar_abrir_os}

Verificar se a OS foi aberta com sucesso
    [Documentation]    Verifica se a OS foi aberta com sucesso.

    # 1. Verificar se aparece a mensagem Ordem de serviço aberta com sucesso.
    Wait Until Element Exist    ${painel_abrir_os.popup_ordem_aberta_com_sucesso}    retries=${TIMEOUT}
    Click    ${painel_abrir_os.popup_botao_ok}    # Fecha a mensagem de sucesso

    # 2. Atualizar a fila e acessar a OS.
    Click    ${painel_principal.botao_atualizar_filas}    retries=${TIMEOUT}
    Wait Until Element Exist    //Text[@Name='${PLACA_ATUAL}']    retries=${TIMEOUT}
    Click    //Text[@Name='${PLACA_ATUAL}']
