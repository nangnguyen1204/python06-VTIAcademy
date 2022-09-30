# bai1
# aList = [1,2,3,4,5]

# for i in range(0, len(aList)):
#     aList[i] = aList[i]**2

# print(aList)

# bai2

# list1 = ['M', 'na', 'i', 'Peter']
# list2 = ['y', "me", "s", "Parker"]

# list3 = []
# for i in range(0, len(list1)):
#     s = list1[i] + list2[i]
#     list3.append(s)

# print(list3)

# 4.3

# list1 = ["hello", "take"]
# list2 = ["Dear" , "Sir"]
# list3 = []
# for i in range(0 , len(list1)):
#     for j in range(0,len(list2)):
#         s = list1[i] + " " + list2[j]
#         list3.append(s)

# print(list3)

# 4.4
# list1 = [5,10,20,26,20,60]

# for i in list1:
#     if i == 20:
#         list1.remove(i)
    
# print(list1)

# 4.5
# path_name = 'D:\\Python\\bai5\\romeo.txt'
# f = open(path_name, 'r')
# wordList = []
# for line in f:
#     words = line.split()
#     for word in words:
#         if word in wordList:
#             continue
#         wordList.append(word)

# wordList.sort()
# print(wordList)

#4.6
# dict_number = {
#     0: 'khong',
#     1: "mot",
#     2: "hai",
#     3: "ba",
#     4: "bon",
#     5: "nam",
#     6: "sau",
#     7: "bay",
#     8: "tam",
#     9: "chin"
# }
# list = list(dict_number.items())

# input = int(input("nhap vao 1 day so : "))
# s =str(input)
# a,b = list(dict_number.items())

# print(dict_number)

# for i in s:
#     if i == a:
#         print(b, end=" ")

# list1 = ["khong", "mot", "hai", "ba", "bon", "nam", "sau", "bay", "tam", "chin"]

# input = input("nhap vao 1 day so : ")

# for i in input:
#     for j in range(0,10):
#         if(int(i) == j):
#             print(list1[j], end=" ")

