# viacep_flutter

Desafio do [web.dio.me](https://web.dio.me) de criar uma aplicação em flutter para exibição e gerenciamento de CEPs utilizando a plataforma Back4App e a API pública ViaCEP.

## Checklist do Desafio

- [x] Criar uma aplicação Flutter
- [x] Criar uma classe de CEP no Back4App
- [x] Consulte um Cep no ViaCep, após retornado se não existir no Back4App, realizar o cadastro
- [x] Listar os CEPs cadastrados em forma de lista, possibilitando a alteração e exclusão do CEP

## Preparando o ambiente

- Criar uma conta no back4app.com
- Criar um app backend as a service no back4app.com
- Criar a classe CEP no app criado e adicionar as seguintes colunas

| Nome        |   Tipo |
|:------------|-------:|
| cep         | String |
| logradouro  | String |
| complemento | String |
| bairro      |      String |
| localidade  |String |
| uf          |     String |
| ibge        |     String |
| gia         |           String |
| ddd         |           String |
| siafi       |           String |

- Copiar o arquivo de exemplo

```
cp .env.example .env
```

- Adicionar informações ao arquivo .env
  (BACK4APP_BASEURL=https://parseapi.back4app.com/classes/CEP)
- Preencher as outras duas variáveis consultando documentação do aplicativo criado no back4app

## Rodando o aplicativo

```
flutter pub get
flutter run
```
