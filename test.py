'''
 * @author DongSon
 * @email dongsonsqtt@mail.com
 * @create date 2018-04-11 
 * @modify date 2018-04-11 
 * @desc test import
'''
#1324 - 1896
from BubbleSort import BbSort
from random import randint
a = []
for i in range(20):
    a.append(randint(1324,1896))
'''count = 0
print("Input number to list or press Enter to sort")
while True:
    try:
        number = int(input(f"Input value of number {count}: "))
    except:
        break
    a.append(number)
    count += 1
    '''
print(f"Input list: {a}")
BbSort(a)
print(f"Sorted list: {a}")
    