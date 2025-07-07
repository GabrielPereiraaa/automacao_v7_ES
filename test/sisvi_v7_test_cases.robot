*** Settings ***
Resource    ../base.resource
Suite Setup    Abrir o Sisvi V7
Suite Teardown    Fechar o Sisvi V7


*** Test Cases ***
Cenário de teste 1: Fazer login com sucesso
    [Documentation]    Testa o login com credenciais válidas.
    [Tags]             login
    Fazer Login
    Verificar se o Login foi bem-sucedido

Cenário 02: Abir uma Os
    [Documentation]    Este teste verifica a abertura de uma Ordem de Serviço (OS) após o login.
    [Tags]             ordem_de_servico
    Abrir uma Os
    Verificar se a OS foi aberta com sucesso

Cenário 03: Preencher dados da Os
    [Documentation]    Este teste verifica o preenchimento dos dados de uma Ordem de Serviço (OS).
    [Tags]             preenchimento_os
    Preencher dados iniciais da Os
    Preencher dados do proprietário
    Preencher informações do veículo
    Preencher dados complementares
