def power(a, b):
    #Calculate value of a^b
    return a ** b

def Divisors():
    result = []
    a = int(input('Input a number: '))
    if a <= 0:
        print('Value must > 0')
        return
    for i in range(1, a):
        if a % i == 0:
            result.append(i)
    return result

def PerfectNumber():
    a = int(input('Input a number: '))
    result = []
    total = 0
    if a <=0:
        print('Value must > 0')
        return
    
    for i in range(1, a):
        if a % i == 0:
            result.append(i)
    for i in result:
        total = total + i
    if total == a:
        print("This is a perfect number")
        return True
    else:
        print("This is not a perfect number")
        return False

def PrimeNumber():
    n = int(input('Input a number: '))
    if n < 2:
        print('Input value must >= 2')
        return
    if n % 2 == 0 and n > 2:
        print('This is not a Prime Number')
        return False
    for i in range(2, n):
        if n % i == 0:
            print('This is not a Prime Number')
            return False
    print('This is a Prime Number')
    return True

def InfiniteSeries():
    r = float(input('Input value r 0<r<1 : '))
    if r < 0 or r > 1:
        print('Invalid input')
        return
    n = int(input('Input N value: '))
    if n < 0:
        print('Input positive value of N')
        return
    total = 0
    for i in range(n+1):
        total = total + power(r,i)
    return total


def myFunction(option):
    # Switch equivalent in python
    # Equivalent switch/case in C/C++ code
    switch={
        1: Divisors,
        2: PerfectNumber,
        3: PrimeNumber,
        4: InfiniteSeries,
        0: exit
    }
    # Get the function from switch dictionary
    func = switch.get(option, lambda: "Please choose a valid function\n")
    # Execute the function
    #func()
    print(f"Result: {func()}\n")
    

while True:
    print("***********************************************************")
    print("1. Find Divisors")
    print("2. Perfect Number")
    print("3. Prime Number")
    print("4. Infinite Series")
    print("0. Exit")
    try:
        option = int(input('Please choose a function or press 0 to exit: '))
    except:
        print('Please input a valid number\n')
        continue
    if option not in [0,1,2,3,4]:
        print('Plase choose a valid function!\n')
        continue
    try:
        myFunction(option)
    except ValueError:
        print('Invalid input\n')