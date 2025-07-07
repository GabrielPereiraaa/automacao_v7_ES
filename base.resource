*** Settings ***
Library    FlaUILibrary

## Locators
Variables    resource/config/ambiente.yml
Variables    resource/locators/painel_login_locators.yml
Variables    resource/data/user_credentials_data.yml
Variables    resource/locators/painel_principal_locators.yml
Variables    resource/locators/painel_abrir_os_locators.yml
Variables    resource/data/informacoes_vistoria_data.yml
Variables    resource/locators/painel_preencher_os/os_painel_locators.yml
Variables    resource/locators/painel_preencher_os/os_dados_iniciais_locators.yml
Variables    resource/locators/painel_preencher_os/os_proprietario_locators.yml
Variables    resource/locators/painel_preencher_os/os_informacoes_veiculo_locators.yml
Variables    resource/locators/painel_preencher_os/os_dados_complementares.yml



## Pages
Resource    resource/pages/painel_login_page.resource
Resource    resource/pages/painel_abrir_os_page.resource
Resource    resource/pages/painel_preencher_os/os_dados_iniciais_page.resource
Resource    resource/pages/painel_preencher_os/os_proprietario_page.resource
Resource    resource/pages/painel_preencher_os/os_informacoes_veiculo_page.resource
Resource    resource/pages/painel_preencher_os/os_dados_complementares_page.resource


## Utils
Resource    resource/utils/gerenciamento_sisvi_v7.resource
Resource    resource/utils/utility_keywords.resource


***Variables***
${TIMEOUT}    5