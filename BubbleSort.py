'''
 * @author DongSon
 * @email dongsonsqtt@mail.com
 * @create date 2018-04-11 
 * @modify date 2018-04-11 
 * @desc BubbleSort algorithm
'''
def BbSort(list):
    length = len(list)
    k = 0
    for i in range(length - 1):
        k = 0
        for j in range(length - 1, i, -1):
            if list[j] < list[j-1]:
                temp = list[j]
                list[j] = list[j-1]
                list[j-1] = temp
                k = 1
        if k == 0:
            break

