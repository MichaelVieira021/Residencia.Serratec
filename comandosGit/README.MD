### Configurar GIT

| Comando | Descrição   |
| ------- | ----------- |
| `git config --global user.name "nome-exemplo"` | Adicionar nome de usuário do GitHub |
| `git config --global user.email usuario@exemplo.com` | Adicionar e-mail do GitHub |
| `git config --global --unset user.email` | Remover e-mail do GitHub |
| `git config --global --unset user.name` | Remover nome de usuário do GitHub |
| `git config --global --list` | Exibir a lista de configurações atuais |
| `git config --list` | Exibir a lista de configurações atuais |
| `ssh-keygen -t ed25519 -C e-mail` | Gerar chave SSH |
| `eval $(ssh-agent -s)` | Verificar agente SSH |
| `ssh-add [caminho]` | Adicionar chave SSH ao seu ambiente de trabalho |

### Criar Novo Projeto

| Comando | Descrição |
| ------- | ----------|
| `git init` | Iniciar o git dentro da pasta |
| `git clone [url]` | Clonar um repositório do GitHub |
| `git status` | Exibir status| 
| `git add [arquivo]` | Adicionar arquivos à área de preparação (staging) |
| `git add .` | Adicionar todos os arquivos novos à área de preparação (staging) |
| `git commit -m "mensagem"` | Confirmar as alterações com uma mensagem descritiva |
| `git rm -r [pasta]` | Remove de forma definitiva uma pasta e todo o seu conteúdo do controle de versão |
| `git rm [arquivo]` | Remove um arquivo do controle de versão |

### Branches e Mesclagem (Merging)

| Comando | Descrição |
| ------- | ----------- |
| `git branch` | Listar todas as branches (o asterisco denota o branch atual) |
| `git branch -a` | Listar todas as branches (locais e remotas) |
| `git branch [nome do branch]` | Criar um novo branch |
| `git branch -d [nome do branch]` | Deletar um branch local |
| `git show-branch --all` | Listar todos os branches locais |
| `git push origin --delete [nome do branch]` | Deletar um branch remoto |
| `git checkout -b [nome do branch]` | Criar um novo branch e alternar para ele |
| `git checkout -b [nome do branch] origin/[nome do branch]` | Clonar um branch remoto e alternar para ele |
| `git checkout [nome do branch]` | Alternar para um branch |
| `git checkout -` | Alternar para o último branch acessado |
| `git checkout -- [nome-arquivo.txt]` | Descartar alterações em um arquivo |
| `git merge [nome do branch]` | Mesclar um branch no branch ativo |
| `git merge [branch de origem] [branch de destino]` | Mesclar um branch em um branch de destino |
| `git stash` | Armazenar alterações não commitadas em um diretório de trabalho temporário |
| `git stash clear` | Remover todas as entradas armazenadas no diretório de trabalho temporário |

### Compartilhar e Atualizar Projetos

| Comando | Descrição |
| ------- | ----------- |
| `git push origin [nome do branch]` | Enviar um branch para o seu repositório remoto |
| `git push origin --delete [nome do branch]` | Deletar um branch remoto |
| `git pull` | Atualizar o repositório local para o commit mais recente |
| `git pull origin [nome do branch]` | Puxar alterações do repositório remoto |
| `git remote add origin ssh://git@github.com/[nome-de-usuario]/[nome-do-repositorio].git` | Adicionar um repositório remoto |
| `git remote -v` | Listar conexões remotas |
| `git remote set-url [nome do branch] [url]` | Alterar a URL |

### Comandos do Terminal 

| Comando | Descrição |
| ------- | --------- |
| `cd [caminho]` | Altera o diretório atual |
| `mkdir [nome]` | Cria um novo diretório |
| `ls -a` | Lista todos os arquivos no diretório, incluindo os ocultos |
| `clear` | Limpar a tela do terminal |
| `Touch [nome.txt]` | Criar um arquivo vazio |
| `nano [nome.txt]` | Editor de texto simples para editar o arquivo especificado |
| `cat [nome.txt]` | Exibe o conteúdo de um arquivo |
| `rm [arquivo]` | Remover arquivos |
| `rm -rf [dir]` | Remove um diretório e seu conteúdo de forma recursiva |
| `pwd` | Exibe o caminho completo do diretório atual |
| `mv` | Move ou renomeia arquivos e diretórios |
| `sudo` | Executa um comando com privilégios de administrador |

