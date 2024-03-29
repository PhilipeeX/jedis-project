<a name="topo-readme"></a>
# Jedis project

[![Ruby on Rails CI](https://github.com/PhilipeeX/jedis-project/actions/workflows/rubyonrails.yml/badge.svg)](https://github.com/PhilipeeX/jedis-project/actions/workflows/rubyonrails.yml) ![GitHub Tag](https://img.shields.io/github/v/tag/PhilipeeX/jedis-project?style=flat) ![Static Badge](https://img.shields.io/badge/rubocop-codestyle?style=flat&logo=rubocop&logoColor=white&label=code%20style&link=https%3A%2F%2Fgithub.com%2Frubocop%2Frubocop) ![Static Badge](https://img.shields.io/badge/passing-tests?style=flat&logo=github&logoColor=white&label=tests&link=https%3A%2F%2Fgithub.com%2FPhilipeeX%2Fjedis-project%2Factions) ![Static Badge](https://img.shields.io/badge/image-docker?style=flat&logo=docker&logoColor=white&label=Docker&labelColor=blue&color=green&link=https%3A%2F%2Fhub.docker.com%2Fr%2Fphilipex%2Fjedis-project%2Ftags) ![GitHub repo size](https://img.shields.io/github/repo-size/PhilipeeX/jedis-project?style=flat&label=Tamanho&color=green) ![GitHub issues](https://img.shields.io/github/issues/PhilipeeX/jedis-project?style=flat) ![GitHub closed issues](https://img.shields.io/github/issues-closed/Philipeex/jedis-project?style=flat) ![GitHub closed pull requests](https://img.shields.io/github/issues-pr-closed/PhilipeeX/jedis-project?style=flat&label=Pull%20requests%20mergeados&color=purple)


## Screenshots

![App Screenshot](https://github.com/PhilipeeX/jedis-project/assets/85847179/84d23b5a-4b9b-4180-bdac-810831c5bf11)

> Este projeto consiste na criação de um sistema de gerenciamento de munícipes, desenvolvido em Ruby e Ruby on Rails, abordando tanto aspectos do backend quanto do frontend. O sistema permite a realização de operações CRUD apenas(Create, Read, Update) para munícipes, com validações dos campos e a peculiaridade de que os munícipes podem estar ativos ou inativos.

## Stack utilizada

**Front-end:** TailwindCSS

**Back-end:** Ruby 3.1.2, Rails 7.0.8

**Database:** PostgreSQL

## Acesso à aplicação em deploy através do link abaixo
https://jedis-project.onrender.com
> obs: É necessário aguardar alguns segundos até o carregamento da página porque é um serviço gratuito.

## Rodando localmente

Clone o projeto

```bash
  git clone https://github.com/PhilipeeX/jedis-project
```

Entre no diretório do projeto

```bash
  cd jedis-project
```

Inicie o Docker

```bash
  docker-compose up -d
```

Acesse a aplicação em localhost porta 3000


## Rodando os testes

Para rodar os testes, rode o seguinte comando

```bash
  bundle exec rspec --exclude-pattern 'spec/features/**/*_spec.rb' --format progress
```

## Setups e deploys

#### Esse arquivo realiza uma série de tarefas automatizadas para melhorar a qualidade e facilitar o processo de integração contínua.


[Rubyonrails.yml](https://github.com/PhilipeeX/jedis-project/blob/main/.github/workflows/rubyonrails.yml)



- Executa testes automatizados.
- Realiza verificações de segurança, incluindo análises com o Brakeman.
- Verifica a qualidade do código usando linters como rubocop, garantindo consistência e boas práticas.
- Além disso, quando um PR é mergeado na 'main', configurei para que automaticamente uma nova imagem Docker seja construída e enviada para o Dockerhub.

[Imagem do projeto no Dockerhub](https://hub.docker.com/repository/docker/philipex/jedis-project)


# Atribuições

> [!TIP]
> - [x] Crie um CRUD de municipes (Exceto deletar). O munícipe tem status ativo e inativo.<br>
   > [Issue relacionada](https://github.com/PhilipeeX/jedis-project/issues/2)
#
> [!TIP]
> - [x] Dados do munícipe: Nome completo, CPF, CNS(cartão nacional de saúde), Email, Data nascimento, Telefone (código do país e ddd), Foto e status.
> - [x] Todos os dados do munícipe são obrigatórios; 
> - [x] CPF, CNS,Email devem ser válidos;
> - [x] Tenha atenção a data de nascimento. Valide os casos impossíveis/improváveis de serem válidos;
> - [x] Foto do munícipe deve ser tamanhos diferentes para servir vários casos.<br>
> [Pull Request](https://github.com/PhilipeeX/jedis-project/pull/8)
#
> [!TIP]
> - [x] Ter a entidade relacional chamada enderenço com Campos: CEP, Logradouro, complemento, bairro, cidade, UF e código IBGE;
> - [x] Todos os dados são obrigatórios, exceto complemento e código IBGE;<br>
>   [Issue relacionada](https://github.com/PhilipeeX/jedis-project/issues/10)
#
> [!IMPORTANT]
> - [x] Após criar/atualizar um munícipe, você deve mandar um Email e sms ao mesmo informando
> sobre o cadastro de suas informações e quando o seu status sofrer alteração;
> - [x] Filtrar municipes por dados dele e/ou de endereço. É livre a escolha do que deve ser feito.<br>
>  [Pull Request release v0.2](https://github.com/PhilipeeX/jedis-project/pull/26)

## Aprendizados

Para envio de sms optei pela utilização da gem Twilio, que se mostrou relativamente fácil de implementar.

No entanto, ao perceber que esta era uma solução paga, iniciei a busca por alternativas que me permitissem realizar o envio de SMS de maneira gratuita.

Após considerar ambas as opções, optei por manter o código pronto, com a lógica da gem Twilio comentada, possibilitando sua rápida ativação quando necessário.

Então para utilizar a gem Twilio, será necessário adicionar as seguintes variáveis de ambiente em credentials

`Rails.application.credentials.twilio[:account_sid]`

`Rails.application.credentials.twilio[:auth_token]`

`Rails.application.credentials.twilio[:twilio_phone]`

Caso contrário, ao remover o comentário '#' do código das regras para envio de sms o seguinte erro ocorrerá:

"[HTTP 400] 21608 : Unable to create record
The number +5524 5525XXXX is unverified. **Trial accounts cannot send messages to unverified numbers**; verify +5524 5525XXXX at twilio.com/user/account/phone-numbers/verified, or purchase a Twilio number to send messages to unverified numbers"


## Apêndice
Author: <strong>Philipe Rodrigues (dev.philipe@outlook.com)</strong>

<p align="right"><a href="#topo-readme">Voltar ao topo</a></p>
