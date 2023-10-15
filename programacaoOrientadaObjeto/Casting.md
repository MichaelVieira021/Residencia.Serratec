Casting Implícito: Também conhecido como "casting automático", ocorre quando você converte um valor de um tipo menor (menos preciso) para um tipo maior (mais preciso) de forma automática, sem a necessidade de código explícito. Por exemplo, de int para double.

```
int numeroInteiro = 5;
double numeroDouble = numeroInteiro; // Casting implícito
```

Casting Explícito: Também conhecido como "casting manual", ocorre quando você converte um valor de um tipo maior (mais preciso) para um tipo menor (menos preciso) de forma explícita, usando uma notação especial. Isso geralmente é necessário quando há perda de precisão envolvida, e você precisa indicar que está ciente dessa perda. Por exemplo, de double para int.

```
double numeroDouble = 5.7;
int numeroInteiro = (int) numeroDouble; // Casting explícito
```




