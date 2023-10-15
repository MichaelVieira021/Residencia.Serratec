A palavra-chave `static` é usada em Java para criar membros (métodos e variáveis) que pertencem à classe em vez de pertencerem a instâncias individuais da classe. 

- **Variáveis Estáticas (ou Atributos Estáticos)**:
  - Uma variável estática pertence à classe em vez de a instâncias individuais.
  - É compartilhada por todas as instâncias da classe.
  - Pode ser acessada diretamente usando o nome da classe, sem a necessidade de criar uma instância.
  - É usada para armazenar informações que são compartilhadas entre todos os objetos da classe.

- **Métodos Estáticos**:
  - Um método estático pertence à classe em vez de a instâncias individuais.
  - Pode ser chamado diretamente usando o nome da classe, sem criar uma instância.
  - Geralmente é usado para operações que não dependem do estado de objetos específicos, como funções utilitárias.

- **Blocos Estáticos**:
  - Um bloco estático é um bloco de código que é executado quando a classe é carregada.
  - É usado para inicializar variáveis estáticas ou realizar outras tarefas de inicialização de classe.

- **Constantes Estáticas**:
  - São variáveis estáticas que são declaradas como `final` e geralmente são usadas para definir valores constantes que não mudam durante a execução do programa.

Uma vez que membros estáticos pertencem à classe em si e não a objetos individuais, eles são compartilhados globalmente por todas as instâncias da classe. No entanto, é importante usá-los com cuidado e compreender as implicações de compartilhar informações globalmente.


