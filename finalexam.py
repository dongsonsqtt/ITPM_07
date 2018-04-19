'''
    My value:
    X: 0.3223729597231245
    Y: 0.11872307867599774
    Z: 0.7405688254350163
    P: 21
    Q: 14
'''
import war_and_peace
# Constant value here:
x = 0.3223729597231245
y = 0.11872307867599774
z = 0.7405688254350163
p = 21
q = 14
#--------End---------
def power(a, b):
    #Calculate value of a^b
    return a ** b

def factorial(n):
    # Calculate value of n! 
    if n < 0:
        return -1 
    fac = 1
    count = 1
    while count <= n:
        fac *= count
        count += 1
    return fac

def qC3(q):
    # Calculate value of qC3
    # q!/(q! * (q-3)!)
    return factorial(q)/(factorial(q) * factorial(q-3))

def SeriesX(p):
    # Series calculate
    total = 1
    for i in range(2, p + 1):
        a = float(1 / i)
        total = float(total + a)
    return total

def SeriesY(q):
    # Series calculate
    total = 1
    for i in range(2, p + 1):
        a = float(1 / (i*i))
        total = float(total + a)
    return total
#Q1 x2 + y7 + (z3 * (67 − 76)) + factorial(p) + qC3
result =power(x,2) + power(y,7) + (power(z,3) * (67-76)) + factorial(p) + qC3(q)
print(result)

#Q2 X2 + Y3
X = SeriesX(p)
Y = SeriesY(q)
result = power(X,2) + power(Y,3)
print(result)

#Q3

