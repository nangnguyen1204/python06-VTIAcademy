# str = "Viet Nam"

# print(type(str))
# print(len(str))
# print(str[-1])
# print(str[1:5])

# print("Viet" in str)

# str1 = "mmmmmmmmm"
# print(str1.replace('m','a',-3))

# lst = ["apple", "is", "a" , "branch", "of" , "America"]
# joinlst = " ".join(lst)
# print(joinlst)

# subject = "Python"
# print("I am studying %s" %(subject))

# print("num1 : {0} , num2 : {1}".format(8,9))

# tinh tong hieu thuong tich cua 2 so nhap vao tu ban phim
# a = int(input("nhap vao so thu nhat: "))
# b = int(input("nhap vao so thu hai: "))
# s = input("nhap vao phep tinh: ")

# if  s == '+' or s =='cong':
#     print("tong 2 so la: ", a+b)
# elif    s== '-' or s=='tru':
#     if(a>=b):
#         print("Hieu 2 so la: ", a-b)
#     else:
#         print("Hieu 2 so la: ", b-a)
# elif    s == '*' or s=='nhan' or s =='x':
#     print("Tich cua 2 so la: " , a*b)
# elif    s=='/' or s =='chia':
#     if  b == 0:
#         print("phep toan khong hop le")
#     else:
#         print("thuong cua 2 so la: ", a/b) 
        
# bai 2 : nhap vao 1 chuoi , kiem tra chuoi do vaf tra ve index cua ki tu viet hoa

# str1 = input("nhap vao 1 chuoi: ")

# for i in range(len(str)):
#     if(ord(str[i])>=65 and ord(str[i]) <=90):
#         print(i)
# lst = []
# for i in range(len(str)):
#     if(str[i].isupper()):
#         lst.append(i)

# strX = ''
# for i in range(0, len(str1)):
#     if str1[i]== str1[i].upper():
#         strX = strX + str(i) + ' '

# print(strX)
str1 = input("nhap vao 1 chuoi: ")

a = len(str1)
c = 0
for i in range(0 , a):
    if(str1[i] != str1[a-i]):
        c+=1

if(c == 0):
    print("chuoi doi xung")
else:
    print("chuoi khong doi xung")