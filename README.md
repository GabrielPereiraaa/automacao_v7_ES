# Automação de Testes - Sisvi V7

## Sobre o Projeto

Este repositório contém a suíte de testes automatizados para a aplicação de desktop **Sisvi V7**. O projeto foi desenvolvido com **Robot Framework** e utiliza a biblioteca **FlaUI** para interação com elementos de interface do Windows.

A arquitetura do projeto segue o padrão **Page Object Model (POM)**, que visa separar a lógica dos testes da representação da interface, resultando em um código mais limpo, reutilizável e de fácil manutenção.

---

## Pré-requisitos

Antes de iniciar, certifique-se de que você tem os seguintes softwares instalados:
* [Miniconda](https://docs.anaconda.com/free/miniconda/).
* A aplicação Sisvi V7 instalada e acessível na máquina de teste.

---

## Guia de Instalação e Configuração

Siga os passos abaixo para configurar seu ambiente de desenvolvimento local.

**1. Clone o Repositório**
```bash
git clone https://github.com/JoaoJunior7/automacao_v7.git
cd automacao_v7
```

**2. Crie o Ambiente Conda utilizando anaconda prompt**
```bash
conda create --name automacao_sisvi python=3.11 -y
```

**3. Ative o Ambiente**
```bash
conda activate automacao_sisvi
```

**4. Instale as Dependências do Projeto**

Para garantir que toda a equipe use as mesmas versões, utilize o arquivo `environment.yml` que esta na pasta raiz do projeto. Este comando irá instalar todas as bibliotecas necessárias no seu ambiente ativo.

```bash
conda env create -f environment.yml
```

---

### Executando Cenários Específicos

Para executar apenas um subconjunto de testes, você pode usar flags para filtrar por **tag** ou por **nome**.

* Use a flag `-i <nome_da_tag>` para executar todos os cenários com uma tag específica.
* Use a flag `-t "<nome_do_cenario>"` para executar um único cenário pelo seu nome exato.

```bash
# Exemplo executando apenas os testes com a tag 'login'
robot -d log -i login test/

# Exemplo executando um teste específico pelo nome
robot -d log -t "Cenário 02: Abir uma Os" test/
```

## Estrutura do Projeto

O projeto está organizado da seguinte forma para facilitar a navegação e a manutenção:

```
├── test/              # Contém os arquivos de teste (.robot) com os cenários de negócio.
├── resource/           # Pasta principal para todos os recursos da automação.
│   ├── config/         # Arquivos de configuração e caminho do sisvi V7 (.yml).
│   ├── data/           # Arquivos com massa de dados para os testes (.yml, .csv).
│   ├── locators/       # Mapeamento dos elementos da UI, separados por tela (.yml).
│   ├── pages/          # Keywords de alto nível que representam as ações em cada tela (.robot).
│   └── utils/          # Keywords de utilidade geral (ex: abrir/fechar app, salvar e integrar laudo).
├── base                # O arquivo central que importa e orquestra todas as libs, variáveis e keywords.
├── log/                # Pasta onde os resultados da execução (logs, reports) são salvos.
└── environment.yml     # Arquivo que define as dependências do projeto.
```

---

## Contribuição

Para manter a qualidade e a organização do projeto, por favor, siga as diretrizes abaixo ao contribuir:

* Mantenha o padrão **Page Object Model (POM)**.
* Crie os locators e as keywords nos arquivos correspondentes dentro da pasta `resource`.
* Documente novas keywords explicando sua finalidade, argumentos e retorno.
```
