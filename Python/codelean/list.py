# n = int(input("nhap do dai chuoi: "))
# lst = []
# c=0
# for i in range(n):
#     c = i+1
#     lst.append(int(input("nhap so thu " + str(c) + ": ")))

# min_value = lst[0]
# for i in lst:
#     if i< min_value:
#         min_value = i

# print("min value : ", min_value)


n = int(input("nhap do dai chuoi: "))
lst = []
c=0
sum = 0
for i in range(n):
    c = i+1
    lst.append(int(input("nhap so thu " + str(c) + ": ")))

for i in lst:
    sum +=i

print(sum)


