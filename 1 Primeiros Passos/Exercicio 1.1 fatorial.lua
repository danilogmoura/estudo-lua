-- define uma função fatorial
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
    if not a then
        io.read()
    end
until a

print(fact(a))