from BubbleSort import BbSort

a = []
count = 0
print("Input number to list or press Enter to sort")
while True:
    try:
        number = int(input(f"Input value of number {count}: "))
    except:
        break
    a.append(number)
    count += 1
print(f"Input list: {a}")
BbSort(a)
print(f"Sorted list: {a}")
    