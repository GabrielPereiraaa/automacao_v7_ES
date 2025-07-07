*** Settings ***
Resource    ../../../base.resource

*** Keywords ***
Preencher informações do veículo
    [Documentation]    Preenche as informações do veículo na Ordem de Serviço (OS).

    # 1. Clica na aba Informações do Veículo.
    Wait Until Element Exist    ${os_informacoes_veiculo.aba_veiculo}    retries=${TIMEOUT}
    Click    ${os_informacoes_veiculo.aba_veiculo}    retries=${TIMEOUT}

    # 2. Preenche os dados do veículo. 
    Set Text To Textbox    ${os_informacoes_veiculo.campo_motor}    ${informacoes_vistoria.informacoes_veiculo.motor}    # Motor
    Set Text To Textbox    ${os_informacoes_veiculo.campo_chassi}    ${informacoes_vistoria.informacoes_veiculo.chassi}    # Chassi
    Set Text To Textbox    ${os_informacoes_veiculo.campo_passageiro}    5   # Capacidade de Passageiros Coletada

    # 3. Salvar as informações do veículo.
    Salvar OS e Confirmar Sucesso