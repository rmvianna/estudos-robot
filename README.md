# Estudos Robot
Este repositório tem por objetivo armazenar os estudos do framework Robot, utilizado para automações de testes.

Para executar os scripts Robot, basta rodar o comando abaixo passando como único argumento o nome do diretório que queira utilizar. O diretório é a "aplicação" alvo dos testes

```powershell
run_robot_scripts.sh organo
```

Se quiser rodar os TestCases de um script específico, pode passar o segundo argumento correspondente ao nome do arquivo

```powershell
run_robot_scripts.sh organo preenchimento_completo
```

## Organo
Esta aplicação foi escrita em React, e extraída diretamente do Alura.
Para evitar a instalação do Node na máquina local, uma imagem Docker foi empregada para abstrair o runtime da aplicação.

Para subir a aplicação, basta acessar a pasta **organo** e rodar o comando abaixo:

```powershell
docker-compose up -d
```

Se for a primeira vez, vai demorar um pouco, pois a imagem vai instalar todas as dependências primeiro. À partir da segunda vez, o comando rodará quase de forma instantânea.

Se tudo funcionar, será possível acessar o site via http://localhost:3000/