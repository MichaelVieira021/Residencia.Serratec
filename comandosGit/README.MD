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
| `git commit -m "mensagem"` | Confirmar alterações (commit) |
| `git rm -r [pasta]` | Remove uma pasta e seu conteúdo de forma recursiva |
| `git rm [arquivo]` | Remove um arquivo confirmado |

### Branches e Mesclagem (Merging)

| Comando | Descrição |
| ------- | ----------- |
| `git branch` | Listar branches (o asterisco denota o branch atual) |
| `git branch -a` | Listar todos os branches (locais e remotos) |
| `git branch [nome do branch]` | Criar um novo branch |
| `git branch -d [nome do branch]` | Deletar um branch |
| `git show-branch --all` | Listar todos os branches locais |
| `git push origin --delete [nome do branch]` | Deletar um branch remoto |
| `git checkout -b [nome do branch]` | Criar um novo branch e alternar para ele |
| `git checkout -b [nome do branch] origin/[nome do branch]` | Clonar um branch remoto e alternar para ele |
| `git checkout [nome do branch]` | Alternar para um branch |
| `git checkout -` | Alternar para o último branch acessado |
| `git checkout -- [nome-arquivo.txt]` | Descartar alterações em um arquivo |
| `git merge [nome do branch]` | Mesclar um branch no branch ativo |
| `git merge [branch de origem] [branch de destino]` | Mesclar um branch em um branch de destino |
| `git stash` | Armazenar alterações em um diretório de trabalho sujo |
| `git stash clear` | Remover todas as entradas armazenadas |

### Compartilhar e Atualizar Projetos

| Comando | Descrição |
| ------- | ----------- |
| `git push origin [nome do branch]` | Enviar um branch para o seu repositório remoto |
| `git push origin --delete [nome do branch]` | Deletar um branch remoto |
| `git pull` | Atualizar o repositório local para o commit mais recente |
| `git pull origin [nome do branch]` | Puxar alterações do repositório remoto |
| `git remote add origin ssh://git@github.com/[nome-de-usuario]/[nome-do-repositorio].git` | Adicionar um repositório remoto |
| `fork` | Copiar um repositório externo |
| `git remote -v` | Listar conexões remotas |
| `git remote set-url [nome do branch] [url]` | Alterar a URL |

### Comandos do Terminal 

| Comando | Descrição |
| ------- | --------- |
| `cd [caminho]` | Mudar de diretório |
| `mkdir [nome]` | Criar diretório |
| `ls -a` | Listar informações sobre os arquivos |
| `clear` | Limpar a tela do terminal |
| `Touch [nome.txt]` | Criar um arquivo vazio |
| `nano [nome.txt]` | Editor de texto simples para editar o arquivo especificado |
| `cat [nome.txt]` | Concatenar arquivos e imprimir na saída padrão |
| `rm [arquivo]` | Remover arquivos |
| `rm -rf [dir]` | Remover diretórios |
| `pwd` | Mostrar o nome do diretório atual |
| `mv` | Mover/renomear arquivos |
| `sudo` | Executar um comando como super usuário |

