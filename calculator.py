def plus():
    a = int(input('Input number a: '))
    b = int(input('Input number b: '))
    return a + b


def minus():
    a = int(input('Input number a: '))
    b = int(input('Input number b: '))
    return a - b


def divide():
    a = int(input('Input number a: '))
    b = int(input('Input number b: '))
    if b == 0:
        return print("Input value b != 0")
    return a / b


def product():
    a = int(input('Input number a: '))
    b = int(input('Input number b: '))
    return a * b


def power():
    x = int(input('Input number x: '))
    y = int(input('Input number y: '))
    return x ** y


def factorial():
    n = int(input('Input number n: '))
    fac = 1
    count = 1
    while count <= n:
        fac *= count
        count += 1
    return fac


def test():
    n = int(input('Input number n: '))
    total = 1
    for i in range(2, n + 1):
        a = float(1 / i)
        total = float(total + a)
    return total


def myFunction(option):
    switch={
        1: plus,
        2: minus,
        3: product,
        4: divide,
        5: power,
        6: factorial,
        7: test,
        0: exit
    }
    # Get the function from switch dictionary
    func = switch.get(option, lambda: "Please choose a valid function\n")
    # Execute the function
    print(f"Result: {func()}\n")


while True:
    print("***********************************************************")
    print("1. Calculate a + b")
    print("2. Calculate a - b")
    print("3. Calculate a * b")
    print("4. Calculate a / b")
    print("5. Calculate x ^ y")
    print("6. Factorial of N")
    print("7. Calculate 1 + 1/2 + 1/3 + .... + 1/n")
    print("0. Exit")
    option = int(input('Please choose a function or press 0 to exit: '))
    myFunction(option)
