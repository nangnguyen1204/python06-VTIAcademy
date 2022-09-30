# 5.1
# def func1(*a):
#     for i in range(0,len(a)):
#         if(i == (len(a) - 1 )):
#             print(a[i])
#         else:
#             print(a[i], end=", ")

# func1(5,10,14)

# 5.2
# list = []
# def calculation(a,b):
#     sum = a + b
#     list.append(sum)

#     minus = abs(a - b)
#     list.append(minus)

#     multiple = a * b
#     list.append(multiple)

#     divide = a/b 
#     list.append(divide)

#     return list

# result = calculation(4,6)
# print("tong 2 so la: ", result[0])
# print("hieu 2 so la: ", result[1])
# print("tich 2 so la: ", result[2])
# print("thuong 2 so la: ", result[3])

# 5.3

# def show_employee(name, salary = 9000):
#     print("Ten nhan vien: ", name)
#     print(f"Muc luong: {salary}$")

# show_employee("Nang")

# 5.4

# def outer_func(a,b):
#     def addition(c,d):
#         return c + d
#     return 5 + addition(a,b)

# print(outer_func(5,3))

# 5.5
# def func5(n):
#     if n < 1:
#         return 0
#     else:
#         return n + func5(n-1)

# print(func5(10))

# from math import sqrt
# from math import pi

# def giai_pt_bac_1(a,b):
#     if(a==0 and b==0):
#         print("phuong trinh vo so nghiem")
#     elif(a == 0 and b != 0):
#         print("phuong trinh vo nghiem")
#     else:
#         print("phuong trinh co nghiem la: ", -b / a)

# def giai_pt_bac_2(a,b,c):
#     if(a == 0 ):
#         giai_pt_bac_1(b,c)
#     else:
#         delta = b**2 - 4*a*c
#         if(delta < 0 ):
#             print("phuong trinh vo nghiem")
#         elif (delta == 0):
#             print("phuong trinh co nghiem kep x1 = x2 =", -b / (2*a))
#         else:
#             x1 = (-b + sqrt(delta)) / (2*a)
#             x2 = (-b - sqrt(delta)) / (2*a)
#             print(f"Phuong trinh co 2 nghiem: x1 = {x1} , x2 = {x2}")

# def calc_P_S_circle(r):
#     P = round(2*pi*r, 2)
#     S = round(pi*r**2, 2)
#     print("Chu vi: ", P)
#     print("Dien tich: ", S)

# def calc_P_S_rectangle(a,b):
#     P = 2*(a + b)
#     S = a *b
#     print("Chu vi: ", P)
#     print("Dien tich: ", S)

# def calc_P_S_triangle(a,b,c):
#     P = a + b +c
#     p = P/2
#     S = round(sqrt(p*(p - a)*(p - b)*(p - c)), 2)
#     print("Chu vi: ", P)
#     print("Dien tich: ", S)

# def main():
#   print("""
# 1.Giai phuong trinh bac nhat
# 2.Giai phuong trinh bac 2
# 3.Tinh chu vi , dien tich
# """)
#   choose_module = int(input("Chon module: "))
#     if(choose_module == 1):
#         print("Giai phuong trinh bac 1 dang ax + b = 0")
#         a = int(input("Nhap a: "))
#         b = int(input("Nhap b: "))
#         giai_pt_bac_1(a,b)
#     elif(choose_module == 2):
#         print("Giai phuong trinh bac 2 dang ax^2 + bx + c = 0")
#         a = int(input("Nhap a: "))
#         b = int(input("Nhap b: "))
#         c = int(input("Nhap c: "))
#         giai_pt_bac_2(a,b,c)
#     else:
#         print("""
#         1.Hinh tron
#         2.Hinh chu nhat
#         3.Hinh tam giac
#         """)
#         choose_shape = int(input("Chon loai hinh: "))
#         if(choose_shape == 1):
#             r = float(input("Nhap ban kinh hinh tron: "))
#             calc_P_S_circle(r)
            
#         elif(choose_shape == 2):
#             a = float(input("Nhap do dai hinh chu nhat: "))
#             b = float(input("Nhap chieu rong hinh chu nhat: "))
#             calc_P_S_rectangle(a,b)
            
#         elif(choose_shape == 3):
#             a = float(input("Nhap do dai canh 1 hinh tam giac: "))
#             b = float(input("Nhap do dai canh 2 hinh tam giac: "))
#             c = float(input("Nhap do dai canh 3 hinh tam giac: "))
#             calc_P_S_triangle(a,b,c)

# main()

from secrets import choice


def sum_n(n):
    sum = 0
    for i in range(0,n+1):
        sum += i
    return sum

def test_prime(n):
    if( n <= 1):
        return False

    for i in range(2,round(n-1)):
        if(n%i == 0):
            return False
    
    return  True
            
def phan_tich_thua_so_nguyen_to(n):
    for i in range(2 , n+1):
        while( n%i == 0 and test_prime(i)):
            print(i,end=" ")
            n /= i


def show_divisor(n):
    for i in range(1,n+1):
        if(n%i == 0):
            print(i,end=" ")
        else: 
            continue


def show_divisor_isprime(n):
    for i in range(1,n+1):
        if( n%i == 0 and test_prime(i) is True):
            print(i,end=" ")

def main():
    n = int(input("nhap vao so n: "))
    print("""
1.Tinh tong cac chu so cua n
2.Phan tich n thanh tich cua thua so nguyen to
3.Liet ke cac uoc cua n
4.Liet ke cac uoc la so nguyen to cua n
    """)
    choice = int(input("Nhap lua chon: "))
    if(choice == 1):
        print(sum_n(n))
    elif(choice == 2):
        phan_tich_thua_so_nguyen_to(n)
    elif(choice == 3):
        show_divisor(n)
    elif(choice == 4):
        show_divisor_isprime(n)
    else:
        print("lua chon sai , chon lai!!")

main()