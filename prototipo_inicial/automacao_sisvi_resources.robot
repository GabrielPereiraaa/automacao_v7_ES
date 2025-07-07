*** Settings ***
Library    FlaUILibrary

*** Variables ***
${APP_PATH}                  C:\\Program Files (x86)\\Sisvi V7.8\\SisviV764bits.exe
${TIMEOUT}                   10
${APP_PID}                   ${EMPTY}    # Variável para armazenar o PID da aplicação
${LOCATOR_CAMPO_USUARIO}    //Edit[@AutomationId='txtLogin']
${LOCATOR_CAMPO_SENHA}      //Edit[@AutomationId='txtSenha'] 
${LOCATOR_BOTAO_LOGIN}      //Button[@AutomationId='btnLogin']
${LOCATOR_PAINEL_PRINCIPAL}    //Button[@AutomationId='btnFilaOrdemServicoLaudo']
@{CPF_SEQUENCE}  s'CTRL+A'    t'84265383041'
@{CEP_SEQUENCE}  s'CTRL+A'    t'66625160'

*** Keywords ***
Abrir o Sisi
    [Documentation]    Inicia a aplicação Sisi e armazena o PID.
    ${pid}=    Launch Application    ${APP_PATH}
    Set Suite Variable    ${APP_PID}    ${pid}
    Log    PID da aplicação: ${APP_PID}
    # Sleep    3s
    Wait Until Element Exist    //Pane[@AutomationId='pbLogoOxxy']   retries=${TIMEOUT}

Fechar o Sisi
    [Documentation]    Fecha a aplicação Sisi.
    Sleep    time_=5s
    Take Screenshot
    Close Application    ${APP_PID}

# KEYWORD REUTILIZÁVEL PARA SALVAR E CONFIRMAR
Salvar OS e Confirmar Sucesso
    [Documentation]    Salva a OS e confirma a mensagem de sucesso.
    
    # Clica no botão Finalizar OS
    Click    //Button[@AutomationId='btnFinalizarOS']
    
    # Aguarda e confirma a mensagem de sucesso
    Wait Until Element Exist    //Text[@Name='Laudo salvo com sucesso']    retries=${TIMEOUT}
    Click    //Button[@Name='OK']    retries=${TIMEOUT}

Integrar o laudo
    [Documentation]    Salva a OS e confirma a mensagem de sucesso.

    # Clica no botão Integrar Laudo
    Click    //Button[@AutomationId='btnIntegrarLaudo']
    
    # Aguarda e confirma a mensagem de sucesso
    Wait Until Element Exist    //Text[@Name='Confirmação dos dados para integração']    retries=${TIMEOUT}
    Click    //Button[@AutomationId='btnSim']    retries=${TIMEOUT}

Fazer Login
    [Documentation]    Preenche as credenciais e clica em LOGIN de forma robusta.
    [Arguments]       ${usuario}    ${senha}

    # 1. Espera o campo de USUÁRIO
    Wait Until Element Is Enabled    ${LOCATOR_CAMPO_USUARIO}    retries=${TIMEOUT}

    # 2. Preenche o usuário.
    Set Text To Textbox    ${LOCATOR_CAMPO_USUARIO}    ${usuario}

    # 3. Espera o campo de SENHA.
    Wait Until Element Is Enabled    ${LOCATOR_CAMPO_SENHA}    retries=${TIMEOUT}

    # 4. Clica no campo de senha para garantir o foco e então digita.
    Click         ${LOCATOR_CAMPO_SENHA}
    Set Text To Textbox    ${LOCATOR_CAMPO_SENHA}    ${senha}

    # 5. Clica no botão LOGIN.
    Click    ${LOCATOR_BOTAO_LOGIN}

Verificar se o Login foi bem-sucedido
    [Documentation]    Verifica se um elemento da tela principal está visível.
    Wait Until Element Exist    ${LOCATOR_PAINEL_PRINCIPAL}    retries=${TIMEOUT}

Abrir uma Os
    [Documentation]    Abre uma Ordem de Serviço (OS) com os dados fornecidos.
    [Arguments]       ${placa}    ${renavan}

    # Armazena a placa como variável de suite para uso posterior
    Set Suite Variable    ${PLACA_ATUAL}    ${placa}

    # 1. Clicar Ordem de Serviço.
    Click    //Button[@AutomationId='btnAbrirOrdemServico']    retries=${TIMEOUT}
    # Click    //Button[@Name='Abrir Ordem de Serviço']    retries=${TIMEOUT}   # Alternativa com Name 
    # Click    /Window/Pane[3]/Window/Pane[3]/Pane/Button[4]    retries=${TIMEOUT}   # Alternativa com caminho absoluto

    # 2. Selecionar a Panorâmica
    Click    /Window/Window/Group[2]/ComboBox    retries=${TIMEOUT}
    # Sleep    3s
    Wait Until Element Exist    //ListItem[@Name='[ PANÔRAMICA ] - [ BOX 01 ]']
    Click    //ListItem[@Name='[ PANÔRAMICA ] - [ BOX 01 ]']

    # 3. Selecionar o tipo de abertura de Os.
    Click  /Window/Window/Group[1]/Pane[2]/Pane[2]/ComboBox
    # Sleep    3s
    Wait Until Element Exist    //ListItem[@Name='Placa']
    Click  //ListItem[@Name='Placa']

    # 4. Preenche a placa.
    Click         /Window[1]/Window/Group[1]/Pane[2]/Pane[3]/Pane[1]/Edit
    # Set Text To Textbox    /Window[1]/Window/Group[1]/Pane[2]/Pane[3]/Pane[1]/Edit    ${placa}    # Alternativa com caminho absoluto
    # Set Text To Textbox    //Edit[@Name='Foto Frente']   ${placa}    # Alternativa com Name 
    Set Text To Textbox    //Edit[@AutomationId='txtPlaca']    ${placa}

    # 5. Espera o campo de renavan e preenche o renavan.
    # Wait Until Element Is Enabled    /Window/Window/Group[1]/Pane[2]/Pane[3]/Pane[2]/Edit    retries=${TIMEOUT}
    Wait Until Element Is Enabled    //Edit[@AutomationId='txtRenavam']     retries=${TIMEOUT}
    Set Text To Textbox    //Edit[@AutomationId='txtRenavam']    ${renavan}

    # 6. Selecionar o vistoriador.
    # Click    /Window/Window/Group[1]/Pane[2]/Pane[4]/ComboBox # Alternativa com caminho absoluto
    Click    //ComboBox[@AutomationId='comboVistoriador']
    Wait Until Element Exist    //ListItem[@Name='JOAO JUNIOR']
    Click    //ListItem[@Name='JOAO JUNIOR']

    # 7. Clica no botão para abrir a OS.
    # Click    /Window/Window/Group[1]/Pane[1]/Button[2]
    Click    //Button[@AutomationId='btnAbrirOrdemServico']

    # 8. Confirmação dos dados de abertura.
    Wait Until Element Exist    //Text[@AutomationId='lblTituloFormulario']    retries=${TIMEOUT}
    Click    //Button[@AutomationId='btnSim']

Verificar se a OS foi aberta com sucesso
    [Documentation]    Verifica se a OS foi aberta com sucesso.

    # 1. Verificar se aparece a mensagem Ordem de serviço aberta com sucesso.
    Wait Until Element Exist    //Text[@Name='Ordem de serviço aberta com sucesso.']    retries=${TIMEOUT}
    Click    //Button[@Name='OK']    # Fecha a mensagem de sucesso

    # 2. Atualizar a fila e acessar a OS.
    Click    //Button[@AutomationId='btnAtualizarFilas']
    Wait Until Element Exist    //Text[@Name='${PLACA_ATUAL}']    retries=${TIMEOUT}
    Click    //Text[@Name='${PLACA_ATUAL}']

Preencher dados iniciais da Os
   [Documentation]    Preenche os dados da Ordem de Serviço (OS) aberta.

    # 1. Selecionar o cliente da Vistoria.
    Click    //ComboBox[@AutomationId='comboBoxCliente']
    Wait Until Element Exist    //ListItem[@Name='PARTICULAR']    retries=${TIMEOUT}
    Click    //ListItem[@Name='PARTICULAR']

    # 2. Selecionar forma de pagamento.
    Click    //ComboBox[@AutomationId='comboBoxFormaPagamento']
    Wait Until Element Exist    //ListItem[@Name='À VISTA']    retries=${TIMEOUT}
    Click    //ListItem[@Name='À VISTA']

    # 3. Selecionar UF do veiculo.
    Click    //ComboBox[@AutomationId='comboboxUFBA']
    Wait Until Element Exist    //ListItem[@Name='BA']    retries=${TIMEOUT}
    Click    //ListItem[@Name='BA']

    # 4. Selecionar Serviços(BA)
    Click    //CheckBox[@Name='TRANSFERENCIA DE PROPRIEDADE']

    # 5. Salvar as informações da Os
    Click    //Button[@AutomationId='btnSalvarInfoOS']

    # 6. Se aparecer o pop-up de histórico, clicar em sim
    # Usamos um locator para o título do pop-up para a verificação.
    Sleep    2s    # Aguarda um pouco para o pop-up aparecer
    ${locator_popup_historico}    Set Variable    //Text[@Name='Histórico de Ordem de Serviço']
    ${popup_apareceu}=    Run Keyword And Return Status    Wait Until Element Exist    ${locator_popup_historico}    retries=${TIMEOUT}

    # A variável ${popup_apareceu} será True se o pop-up aparecer, ou False se não aparecer.
    IF    ${popup_apareceu} == True
        # Se a condição for verdadeira, executa o que está aqui dentro.
        Log      Pop-up de histórico encontrado. Clicando em 'Sim'.
        Click    //Button[@AutomationId='btnSim']
    ELSE
        # Se a condição for falsa, executa o que está aqui.
        Log      Pop-up de histórico não apareceu, continuando o teste.

    END

Preencher dados do proprietário
    [Documentation]    Preenche os dados do proprietário na Ordem de Serviço (OS).

    # 1. Clica na aba Dados do Proprietário.
    Wait Until Element Exist    //TabItem[@Name='Dados do Proprietário']    retries=${TIMEOUT}
    Click    //TabItem[@Name='Dados do Proprietário']    retries=${TIMEOUT}

    # 2. Selecionar se é pessoa fisica ou juridica.
    Click    //ComboBox[@AutomationId='comboBoxPropNovoTipoPessoa']
    Wait Until Element Exist    //ListItem[@Name='FISICA']   retries=${TIMEOUT}
    Click    //ListItem[@Name='FISICA']

    # 3. Preenche os dados do proprietário.
    Click    //Edit[@AutomationId='mtxtPropNovoCPFCNPJ']    # Clica no campo CPF/CNPJ para garantir o foco
    Press Keys    ${CPF_SEQUENCE}    //Edit[@AutomationId='mtxtPropNovoCPFCNPJ']     # CPF/CNPJ
    Set Text To Textbox    //Edit[@AutomationId='txtPropNovoRGInscEst']    432904050     # RG
    Set Text To Textbox    //Edit[@AutomationId='txtPropNovoNomeRazao']     João Teste    # Nome completo ou Razão Social
    Set Text To Textbox    //Edit[@AutomationId='txtPropNovoDDD']   11    # dd
    Set Text To Textbox    //Edit[@AutomationId='txtPropNovoTelefone']     911111111    # telefone
    Click    //Edit[@AutomationId='mtxtPropNovoCEP']    # Clica no campo CEP para garantir o foco
    Press Keys    ${CEP_SEQUENCE}    //Edit[@AutomationId='mtxtPropNovoCEP']     # CEP
    Set Text To Textbox    //Edit[@AutomationId='txtPropNovoEndereco']     Rua Teste    # endereço
    Set Text To Textbox    //Edit[@AutomationId='txtPropNovoNumero']     123    # numero

    # 3 . Selecionar baixo e municipio.
    #Municipio
    Click    //ComboBox[@AutomationId='comboBoxPropNovoMunicipio']
    Wait Until Element Exist    //ListItem[@Name='ABAIRA']   retries=${TIMEOUT}
    Click    //ListItem[@Name='ABAIRA']
    
    # Bairro
    Click    //ComboBox[@AutomationId='comboBoxPropNovoBairro']
    Wait Until Element Exist    //ListItem[@Name='CENTRO']   retries=${TIMEOUT}
    Click    //ListItem[@Name='CENTRO']
    
    # 4. Salva os dados do proprietário.
    Salvar OS e Confirmar Sucesso

Preencher informações do veículo
    [Documentation]    Preenche as informações do veículo na Ordem de Serviço (OS).

    # 1. Clica na aba Informações do Veículo.
    Wait Until Element Exist    //TabItem[@Name='Informações do Veículo']    retries=${TIMEOUT}
    Click    //TabItem[@Name='Informações do Veículo']    retries=${TIMEOUT}

    # 2. Preenche os dados do veículo. 
    Set Text To Textbox    //Edit[@AutomationId='txtMotorVeiculo']    KD05E5E350693    # Motor
    Set Text To Textbox    //Edit[@AutomationId='txtChassiVeiculo']    9C2KD0550ER350693    # Chassi

    # 3. Salvar as informações do veículo.
    Salvar OS e Confirmar Sucesso

Preencher dados complementares
    [Documentation]    Preenche os dados complementares na Ordem de Serviço (OS).

    # 1. Clica na aba Dados Complementares.
    Wait Until Element Exist    //TabItem[@Name='Dados Complementares']    retries=${TIMEOUT}
    Click    //TabItem[@Name='Dados Complementares']    retries=${TIMEOUT}

    # 2. Seleciona o Destino de Transferência.

    # Estado
    Click    //ComboBox[@AutomationId='comboBoxUFTransferencia']
    Wait Until Element Exist    //ListItem[@Name='BA']    retries=${TIMEOUT}
    Click    //ListItem[@Name='BA']

    # Município
    Click    //ComboBox[@AutomationId='comboBoxMunicipioTransferencia']
    Wait Until Element Exist    //ListItem[@Name='ALAGOINHAS']    retries=${TIMEOUT}
    Click    //ListItem[@Name='ALAGOINHAS']

    # 3. Preenche os dados complementares.
    Set Text To Textbox    //Edit[@AutomationId='txtKilometragem']    0   # Kilometragem

    # 4. Seleciona Para quem a nota fiscal será emitida.
    Click    //ComboBox[@AutomationId='comboTomadorNotaFiscal']
    Wait Until Element Exist    //ListItem[@Name='Cliente (Aba Ordem de Serviço)']    retries=${TIMEOUT}
    Click    //ListItem[@Name='Cliente (Aba Ordem de Serviço)']

    # 5. Troca de placa.
    Click    //ComboBox[@AutomationId='ddlServicoPlaca']
    Wait Until Element Exist    //ListItem[@Name='NAO PRECISA DE PLACA OU LACRE']    retries=${TIMEOUT}
    Click    //ListItem[@Name='NAO PRECISA DE PLACA OU LACRE']

    # 5. Salvar os dados complementares.
    Salvar OS e Confirmar Sucesso

    Integrar o laudo

