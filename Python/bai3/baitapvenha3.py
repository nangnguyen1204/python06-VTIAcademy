#  3.1
# for i in range(300):
#     if(i%3==0):
#         print(i,end=' ')

# 3.2

# a = input("nhap vao chuoi: ")
# count =0
# for i in a:
#     # if(ord(i) > 47 and ord(i) < 58): 
#     if(i.isnumeric()):
#         count +=1

# print("tong ki tu la so trong chuoi la: ", count)

# 3.3

# s = "bai tap mon lap trinh python"

# for i in s.split():
#     print(f"{i} \n")


        

# C = input("Choose your charecter to insert. ")
# P = int(input("Choose your character's position. "))
# S = input("Choose your string. ")
 
# if P > len(S):
#     print(S)
# else:
#     st = S[:P] + C + S[P:]
 
#     print(st)
#     print(C, P, S)

# 3.5
# n = int(input("nhap so can kiem tra: "))

# for i in range(2,n):
#     if(n%i == 0):
#         print(f"{n} khong la so nguyen to")
#         break
# else: print(f"so {n} la so nguyen to")

# 3.6

# a = int(input("nhap so thu 1: "))
# b = int(input("nhap so thu 2: "))

# i = min(a,b)

# if(a==0 or b==0):
#     print(f"UCLN({a},{b}): ", a+b)
# else:
#     m =a
#     n=b
#     while(m!=n):
#         if(m>n):
#             m-=n
#         else:
#             n-=m

# print(f"UCLN({a},{b}): ", m)

# 3.7
# n = int(input("nhap vao so luong so nguyen: "))
# sum = 0
# for i in range(n+1):
#     sum += i

# print(f"Tong {n} so nguyen la: " , sum)

# 3.8

# n = int(input("nhap n :"))
# sum = 0
# for i in range(2,n):
#     for j in range(2,i):
#         if(i%j == 0):
#             break
#     else:
#         sum+=i

# print("tong cac so nguyen to nho hon n : ", sum)

# 3.9

# n = int(input("nhap n: "))
# i=1
# count = 0
# sum = 0
# while  count < n :
#     i+=1
#     for j in range(2,i):
#         if(i%j ==0):
#             break
#     else:
#         sum +=i
#         count +=1

# print(f"Tong {n} so nguyen to dau tien la: ", sum)
        
# 3.10

# for i in range(1,11):
#     for j in range(2,10):
#         print("{0:>2}x{1:>2}= {2:>2}".format(j,i, i*j),end='  ')
#     print()

# 3.11

# n = 100000000

# for i in range(1,11):
#     c = round(n*(1.03**i),2)
#     print(f"so tien sau ki han thu {i} la: ", c)

# 3.9

# for i in range(8):
#     print("*"*i)

# for i in range(3):
#     print("*********")


