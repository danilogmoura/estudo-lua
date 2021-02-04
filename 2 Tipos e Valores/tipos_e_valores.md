Função type
============

```lua
print(type("Hello world"))  --> string
print(type(10.4*3))         --> number
print(type(print))          --> function
print(type(type))           --> function
print(type(true))           --> boolean
print(type(nil))            --> nil
print(type(type(X)))        --> string
```

Independente do valor de **X**, o resultado será "string", pois o type resulta sempre em uma cadeia de caracteres.

Variáveis não tem tipos predeficidos; qualquer variável pode conter valores de qualquer tipo:

```lua
print(type(a))  --> nil ('a' não foi inicializada) 

a = 10
print(type(a))  --> number

a = "a string!!"
print(type(a))  --> string

a = print
print(type(a))  --> function
```

* **Nil**

    Nil é um tipo com um único valor, **nil**, cuja propriedade mais importante é ser diferente de qualquer outro. Lua usa nil como uma espécie de não valor, a fim de representar a ausência de um valor útil. Como vimos antes, uma variável global, por padrão, tem um valor nil antes da sua primeira atribuição, e você pode atribuir nil a uma variável global para apagá-la.

* **Booleanos**

    O tipo boolean tem dois valores, **false** e **true**, que representam os valores booleanos tradicionais. No entanto, booleanos não detêm o monopólio dos valores de condição: em Lua, qualquer valor pode representar uma condição. Testes condicionais (por exemplo, condições em estruturas de controle) consideram tanto **false** quanto nil como falso e qualquer outro valor como verdadeiro. Em particular, Lua considera tanto zero quanto a cadeia vazia como verdadeiro em testes condicionais.

* **Números**

    O tipo **number** representa números reais (ponto flutuante de precisão dupla). Lua não tem um tipo inteiro.

    Inteiros têm representações exatas e, por isso, não têm erros de arredondament.

    A maioria das CPU modernas realiza aritmética de ponto flutuante tão rapidamente quanto (ou, ou até mesmo, mais rápido do que) aritmética inteira. Apesar disso, é fácil compilar Lua para usar outro tipo para números, como **longs** ou **floats** (precião simples). Isso é particularmente útil em plataformas sem suporte de **hardware** para ponto flutuante, como sistemas embarcados. Veja o arquivo **luaconf.h** na distribuição de Lua para mais detalhes.

    Podemos escrever constantes numéricas com uma parte decimal e um expoente decimal opcionais. Ecemplos contanstes numéricas válidas são:
    ```
    4   0.4     3.57e-
    3   0.3e12  5E+20
    ```

    Além disso, podemos escrever constantes hexadecimais usando o prefixo 0x. Desde Lua 5.2, as constantes hexadeciamais podem ter também uma parte fracionária e um expoente binário (com prefixo 'p' ou 'P'), como nos exemplos a seguir:

    ```
    0xff (255)  0x1A3 (419) 0x0.2 (0.125)   0x1p-1 (0.5)    0xa.bp2 (42.75)
    ```
    (Para cada constante, indicamos sua representação decimal entre parênteses.)

* **Cadeias**

    Cadeias em Lua são valores imutáveis. Você não pode modificar um caractere delas, como você faz em C; em vez disso, você cria uma nova cadeia com as modificações desejadas, como no exemplo a seguir.

    ```lua
    a = "one string"
    b = string.gsub(a, "one", "another") -- muda partes da cadeia

    print(a)    --> one string
    print(b)    --> another string
    ```
    As cadeias em Lua estãi sujeitas ao gerenciamento de memória automático, como todos os outros objetos de Lua (tabelas, funções etc.)
    Uma cadeia pode conter uma única letra ou um livro inteiro. Os programas que manipulam cadeias com 100k ou 1M de caracteres não são incomuns em Lua.
    Você pode obter o comprimento de uma cadeia usando o operador **'#'** (chamado operador de comprimento):

    ```lua
    a = "hello"
    print(#a)           --> 5
    print(#"good\0bye") --> 8
    ```

    Podemos delimitar cadeias literais por meio de aspas simples ou duplas:

    ```lua
    a = "a line"
    b = 'another line'
    ```
    Elas são equivalentes; a única diferença é que, dentro de uma cadeia delimitada por um determinado tipo das aspas, você pode usar outro tipo sem escapes.
    Por uma questão de estilo, a maioria dos programadores usa sempre o mesmo tipo de aspas para o mesmo tipo de cadeias, todavia os "tipos" das cadeias dependem do programa em questão. Uma biblioteca que manipula XML, por exemplo, pode reservar cadeias com aspas simples para fragmentos XML, porque frequentemente eles contêm aspas duplas.
    As cadeias em Lua podem conter as seguintes sequências de escape, similares às de C:

    |Escape   	|Descrição   	|
    |:---	|:---	|
    |\a  	|campainha   	|
    |\b 	|backspace   	|
    |\f   	|alimetação de formulário   	|
    |\n  	|quebra de linha   	|
    |\r 	|retorno de carro   	|
    |\t 	|tabulação horizontal   	|
    |\v 	|tabulação vertical   	|
    |\\\ 	|barra invertida   	|
    |\\" 	|citação [aspas duplas]   	|
    |\\' 	|apóstrofo [aspas simples]   	|

    Os exemplos a seguir ilustram seu uso:
    ```
    > print("one line\nnext line\n\"in quotes\", 'in quotes'")
    one line
    next line
    "in quotes", 'on quotes'

    > print(''a backslash inside quotes: \'\\\'')
    a baskslash inside quotes: '\'

    > print("a simpler way: '\\'")
    a simpler way: '\'
    ```
    Também podemos especificar um caractere em uma cadeia pelo seu valor numérico nas sequências de escape \ddd e \x\hh, em que ddd é uma sequência de até três dígitos decimais, e hh é uma sequências de , exatamente, dois dígitos hecadecimais. Como exemplo um pouco mais complexo, temos que os literais "alo\n123\"" e '971o\10\04923"' têm o mesmo valor em sistema usando ASCII:97 é o código ASCII para 'a'; 10 é o código para quebra de linha; e 49 é o código para o dígito ; '1' (nesse exemplo, devemos escreve 49 com três dígitos, como \049, pois ele é seguido por outro dígito; caso contrário, Lua iria ler o número 492). Podemos também escrever essa mesma cadeia como '\x61\x6c\x6f\x0a\x31\x32\x33\x22', representando cada caractere por seu código hexadecimal.

