*** Settings ***
Resource    ../../base.resource


*** Keywords ***
Fazer Login
    [Documentation]    Preenche as credenciais e clica em LOGIN de forma robusta.

    # 1. Espera o campo de USUÁRIO
    Wait Until Element Is Enabled    ${painel_user.campo_usuario_login}    retries=${TIMEOUT}
    
    # 2. Preenche o usuário.
    Set Text To Textbox    ${painel_user.campo_usuario_login}    ${user_credentials.login}

    # 3. Espera o campo de SENHA
    Wait Until Element Is Enabled    ${painel_user.campo_senha_login}    retries=${TIMEOUT}

    # 4. Clica no campo de senha para garantir o foco e então digita
    Click    ${painel_user.campo_senha_login}
    Set Text To Textbox    ${painel_user.campo_senha_login}    ${user_credentials.password}

    # 5. Clica no botão LOGIN.
    Click    ${painel_user.botao_login}

Verificar se o Login foi bem-sucedido
    [Documentation]    Verifica se um elemento da tela principal está visível.
    Wait Until Element Exist    ${painel_principal.botao_fila_ordem_servico_laudo}    retries=${TIMEOUT}