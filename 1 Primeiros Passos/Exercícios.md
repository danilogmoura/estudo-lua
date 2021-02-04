# Exercícios

    1.1 Execute o exemplo do fatorial. O que acontecerá com o seu programa se você inserir um número negativo? Modifique o exemplo para evitar esse problema.

Dá erro de execução.

```lua 
function fact(n)
    if n == 0 then
        return 1
    else 
        return n * fact(n -1)
    end
end

repeat
    print("entre com um número:")
    a = tonumber (io.read("*number"))  -- lê um número
    if a then
        print(fact(a))
    end
until a
```

    1.2 Execute o exemplo twice, tanto carregando o arquivo com a opção -l quanto com dofile. Qual forma você prefere?

Prefiro dofile.

    1.3 Você pode citar outras linguagens que usem -- para comentários?

    1.4 Quais das cadeias seguintes são identificadores válidos?
    ___  _end  End  end  until?  nil  NULL

end, null e nill

    1.5 Escreva um script simples que imprima o próprio nome sem previamente o conhecer.

```lua
print("Digite seu nome")
io.flush()
local a = io.read()
print(a)
```