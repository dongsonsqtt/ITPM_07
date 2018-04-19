a = []
b = []
def inputA():
    print("Input A-3x4 matrix:")
    for i in range(3):
        a.append([])
        for j in range(4):
            try:
                value = int(input(f'Input A[{i}][{j}] value: '))
                a[i].append(value)
            except:
                print('Invalid input, please input a valid number again')
                inputA()
                return
                
def inputB():
    print("\nInput B-4x3 matrix:")
    for i in range(4):
        b.append([])
        for j in range(3):
            try:
                value = int(input(f'Input B[{i}][{j}] value: '))
                b[i].append(value)
            except:
                print('Invalid input, please input a valid number again')
                inputB()
                return
                
                

c = [[0,0,0,0],
     [0,0,0,0],
     [0,0,0,0]]

inputA()
inputB()

for i in range(len(a)):
   # iterate through columns of A
   for j in range(len(b[0])):
       # iterate through rows of B
       for k in range(len(b)):
            c[i][j] += a[i][k] * b[k][j]

print(c)
