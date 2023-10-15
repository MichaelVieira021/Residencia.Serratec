A herança em Java é um conceito fundamental da programação orientada a objetos (POO) que permite criar novas classes (subclasses) com base em classes existentes (superclasses). A ideia principal da herança é reutilizar código e estabelecer relacionamentos entre classes.

Pontos-chave da herança em Java:

Superclasse e Subclasse: A classe da qual você herda é chamada de superclasse, e a classe que herda é chamada de subclasse.

Extensão: A palavra-chave `extends` é usada para criar uma relação de herança. A subclasse estende a superclasse, o que significa que a subclasse herda os campos (atributos) e métodos da superclasse.

Acesso aos Membros: Os membros (atributos e métodos) da superclasse podem ser acessados diretamente na subclasse, a menos que sejam privados. Se forem privados, eles não são visíveis na subclasse. Nesse caso verera ser protected.

Sobrescrita de Métodos: A subclasse pode substituir (sobrescrever) métodos herdados da superclasse para fornecer sua própria implementação. Isso é feito usando a anotação @Override.

Construtores: As subclasses geralmente chamam um construtor da superclasse usando a palavra-chave super() no seu próprio construtor.

A herança em Java é uma ferramenta poderosa para criar hierarquias de classes, promover a reutilização de código e estabelecer relacionamentos entre objetos. É uma parte fundamental da POO e é amplamente utilizada na linguagem Java e em muitas outras linguagens orientadas a objetos.

private: Acessível somente dentro da própria classe.
protected: Acessível dentro da própria classe e por suas subclasses (mesmo em pacotes diferentes).
