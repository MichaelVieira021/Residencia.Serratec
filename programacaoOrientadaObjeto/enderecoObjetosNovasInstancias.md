
```
Conta conta1 = new Conta();  
Conta conta2 = conta1;
```
o que acontece é que conta1 armazena "TIPO" um `link` do objeto.
então conta2 sendo = conta1 qualquer alteração que seja feita em qualquer variavel
sera refletida em ambas;

cada NEW é um novo objeto, cada 1 com seu próprio endereço.

***

ao criar 
```
Conta conta1 = new Conta();   
Conta conta2 = new Conta();
```
ao atribuir que `conta2 = conta1;` o Objeto da conta2 será destruído, permanecendo somento o Objeto instanciado na conta1.




