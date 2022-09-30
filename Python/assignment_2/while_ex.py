# bai2.8 lai ngan hang

# t=12
# a = 400 -12*20

# while a>=0:
#     a =(a-20)+(a*10)/1200
#     t+=1
  
# print("So thang de tra het no la: ", t)

# bai 2.9: tinh tong cac chu so

# a = int(input("nhap vao 1 so nguyen : "))
# total = 0

# while   a>0:
#     total = total + a%10
#     a = int(a/10)

# print("tong cac chu so la:", total)

#bai 2.10: dao nguoc so nguyen

# a = int(input("nhap vao 1 so nguyen : "))
# i=0
# s=''
# while   a>0:
#     i=a%10
#     s = s + str(i)
#     a = int(a/10)

# print(s)

# bai 2.11

# i = 0
# s = ''
# while i<3:
#     s = s + '*'
#     i+=1
#     print(s)

# bai2.12
# i = 1
# s = ''
# while i<=5:
#     s = s + ' ' + str(i)
#     i+=1
#     print(s)

# bai2.13

# a = int(input("nhap vao 1 so tu nhien: "))
# sum = 0

# while   a>0:
#     sum +=a
#     a-=1

# print("tong la: " , sum)

# bai 2.14:
# i = 1
# s = ''
# while i<=5:
#     s = str(i) + ' ' + s
#     i+=1
#     print(s)

# bai 2.15: chuoi fibonacci
# n = int(input('nhap do dai chuoi fibonacci: '))
# t1,t2 = 0,1
# next_term = t1 + t2
# i= 3
# s= ''
# while  i <=n:
#      s= s + ' ' + str(next_term)
#      t1 = t2
#      t2 = next_term
#      next_term = t1 + t2
#      i+=1

# print('0 1' + s)

a = 5
while (a > 0):
    b = a
    while (b > 0):
        print (b, end = "   ")
        b -= 1
    print("")
    a -= 1
