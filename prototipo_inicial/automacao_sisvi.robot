*** Settings ***
Documentation     Suite de testes de automação para a aplicação Sisi v7.8
Resource          automacao_sisvi_resources.robot
Test Setup        Abrir o Sisi
Test Teardown     Fechar o Sisi

*** Test Cases ***
Cenário 01: Login com Credenciais Válidas
    [Documentation]    Este teste verifica o fluxo de login com um usuário e senha corretos.
    [Tags]             login

    Fazer Login    joao.testeba    oxxy@2024
    Verificar se o Login foi bem-sucedido

Cenário 02: Abir uma Os
    [Documentation]    Este teste verifica a abertura de uma Ordem de Serviço (OS) após o login.
    [Tags]             ordem_de_servico

    # Fazer Login    joao.testeba    oxxy@2024
    # Verificar se o Login foi bem-sucedido
    Abrir uma Os    PJB0D49    01041130730
    Verificar se a OS foi aberta com sucesso

Cenário 03: Preencher dados da Os
    [Documentation]    Este teste verifica o preenchimento dos dados de uma Ordem de Serviço (OS).
    [Tags]             preenchimento_os

    Preencher dados iniciais da Os
    Preencher dados do proprietário
    Preencher informações do veículo
    Preencher dados complementares

Cenário 04: Caminho feliz
    [Documentation]    Este teste verifica o fluxo feliz da aplicação, onde todas as ações são realizadas com sucesso.
    [Tags]             fluxo_feliz

    Fazer Login    joao.testeba    oxxy@2024
    Verificar se o Login foi bem-sucedido
    Abrir uma Os    PJB0D49    01041130730
    Verificar se a OS foi aberta com sucesso
    Preencher dados iniciais da Os
    Preencher dados do proprietário
    Preencher informações do veículo
    Preencher dados complementares