
# a = int(input("nhap 1 so bat ki : "))
# print("so vua nhap: " , a)

# if      a == 2:
#         print("thu 2")
# elif    a == 3:
#         print("thu 3")
# elif    a == 4:
#         print("thu 4")   
# elif    a == 5:
#         print("thu 5")
# elif    a == 6:
#         print("thu 6")
# elif    a == 7:
#         print("thu 7")
# elif    a == 8:
#         print("chu nhat")
# else:
#         print("khong phai ngay trong tuan")

#  giai phuong trinh bac 2

# from cmath import sqrt


# a = int(input("nhap a : "))
# b = int(input("nhap b : "))
# c = int(input("nhap c : "))

# delta = b**2 - 4*a*c

# if  a == 0:
#     if      b==0:
#             if  c==0:
#                 print("phuong trinh vo so nghiem")
#             else:
#                 print("phuong trinh vo nghiem")
#     else:            
#         print("phuong trinh co nghiem: ", -c/b)
# else:
#     if      delta <0 :
#         print("phuong trinh vo nghiem")
#     elif    delta == 0:
#         print("phuong trinh co nghiem kep x1 = x2 =", -(b/(2*a)))
#     else:
#         print("phuong trinh co 2 nghiem: ")
#         print("x1 = ", (-b + sqrt(delta))/(2*a))
#         print("x2 = ", (-b - sqrt(delta))/(2*a))


# Bai3 : nhap vao 3 canh cua tam giac .kiểm tra điều kiện 3 cạnh , hiển thị loại tam giác, tính diện tích

# from math import sqrt


# a = float(input("nhap do dai canh a: "))
# b = float(input("nhap do dai canh b: "))
# c = float(input("nhap do dai canh c: "))


# if  a+b<c or b+c<a or c+a<b:
#     print("khong phai hinh tam giac")
# else:
#     p = (a + b + c)/2
#     s = sqrt(p*(p - a)*(p - b)*(p - c))
#     if  a == b == c :
#         print("Day la tam giac deu")
#         print("Dien tich tam giac la: ", s)
#     elif    a==b or b==c or a==c:
#         print("Day la tam giac can")
#         print("Dien tich tam giac la: ", s)
#     elif    a**2 + b**2 == c**2 or b**2 + c**2 == a**2 or a**2 + c**2 == b**2:
#         print("Day la tam giac vuong")
#         print("Dien tich tam giac la: ", s)
#     else :
#         print("Day la tam giac thuong")
#         print("Dien tich tam giac la: ", s)

# bai 4 : chuyen tu thap phan sang nhi phan

# x = int(input("nhap vao x: "))
# s = ''
# while  x > 0:
#     i = x%2
#     s = str(i) + s
#     x = x//2
    
# print(s)

# bai 2.3: nhap 1 so va in ra thang tuong ung va so ngay trong thang

# a = int(input("nhap vao 1 thang: "))

# if  a < 1 or a > 12:
#     print("so nhap vao khong hop le")
# else:
#     if  a==2:
#         print("thang 2 co 28 hoac 29 ngay")
#     elif  a == 1 or a==3 or a==5 or a==7 or a==8 or a==10 or a==12 :
#         print("thang " + str(a) + " co 31 ngay")
#     else:
#         print("thang " + str(a) + " co 30 ngay")
        
# bai 2.4 : tim max trong 4 so

# a = int(input("Nhap vao so thu 1: "))
# b = int(input("Nhap vao so thu 2: "))
# c = int(input("Nhap vao so thu 3: "))
# d = int(input("Nhap vao so thu 4: "))

# m = 0
# if a>m:
#     m=a

# if b>m:
#     m=b

# if c>m:
#     m=c

# if d>m:
#     m=d

# print("so lon nhat la: " , m)

# bai2.5: nhap vao thang va xuat ra mua cua thang

# a = int(input("nhap vao 1 thang: "))

# if  a < 1 or a > 12:
#     print("so nhap vao khong hop le")
# else:
#     if  a>=1 and a<=3:
#         print("thang " + str(a) + " la thang mua xuan")
#     elif  a>3 and a <7 :
#         print("thang " + str(a) + " la thang mua he")
#     elif  a>6 and a<10:
#         print("thang " + str(a) + " la thang mua thu")
#     else:
#         print("thang " + str(a) + " la thang mua dong")

# bai2.6 tinh so tien bang so km da nhap

# s = float(input("nhap vao so km: "))
# t=0

# if  s <1:
#     t = 0
# elif    s==1:
#     t = 5000
# elif    s>1 and s<= 5:
#     t = (s-1)*4500 + 5000
# elif    s>5 and s<=120:
#     t = (s-5)*3500 + 4500*4 + 5000
# else:
#     t = ((s-5)*3500 + 4500*4 + 5000)/10

# print("so tien phai tra la: ", t)

# bai 2.7: tinh tien su dung may tinh theo so gio bat dau va ket thuc

# begin = int(input("Nhap so gio bat dau: "))
# end  = int(input("Nhap so gio ket thuc: "))
# h = end - begin
# t = 0

# if  begin >=0 and begin <=7:
#     if  h>=7:
#         t = (h*5000*300*60)/0.15
#     else:
#         t = h*5000*300
# elif    begin>7 and begin<=17:
#     if  h>=6:
#         t=h*5000*400*60*10
#     else:
#         t= h*5000*400
# else:
#     if  h>=4:
#         t = (h*5000*350*60)/0.12
#     else:
#         t = h*5000*350

# print("so tien phai tra la: ", t)