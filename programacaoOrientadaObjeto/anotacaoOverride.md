Uso: A anotação @Override é colocada antes da declaração de um método na subclasse que se destina a substituir um método da superclasse.

Verificação de Assinatura: O compilador verifica se o método na subclasse tem a mesma assinatura (nome, número e tipo de parâmetros) que o método na superclasse que está sendo substituído. Se não houver correspondência exata, o compilador gerará um erro.

Opcional, mas Recomendado: Embora o uso de @Override seja opcional, é altamente recomendado usá-lo ao sobrescrever métodos. Isso ajuda a evitar erros de digitação e sinaliza claramente sua intenção de sobrescrever um método.

Legibilidade do Código: O uso de @Override torna o código mais legível, pois indica claramente que um método na subclasse tem a intenção de substituir um método da superclasse.

Facilita a Manutenção: Quando você ou outros desenvolvedores revisam o código, a presença da anotação @Override facilita a identificação de métodos que foram projetados para substituir métodos da superclasse.
