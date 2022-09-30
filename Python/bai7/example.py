# function tra ve nhieu gia tri

# def calc_area_and_perimeter(width, height):
#     '''
#     func tinh chu vi va dien tich hcn
#     '''
#     S = width * height
#     C = 2*(width + height)
#     return S, C

# A, P = calc_area_and_perimeter(5,4)

# print("chu vi la: ", A)
# print("dien tich la: ", P)

# # function co tham so mac dinh

# def get_address(street, city, country = "Viet Nam"):
#     return f"{street}, {city}, {country}"

# print(get_address('Ba Dinh', 'Ha Noi'))
# print(get_address('Ba Dinh', 'Ha Noi','Singapore'))

# # Doi so argument( *arg) ==> khong xac dinh so luong doi so hoac so luong doi so co the thay doi

# def sum(*count):
#     '''
#     func tinh tong cac so tu nhien
#     '''
#     s = 0;
#     for i in range(len(count)):
#         s += count[i]
#     return s

# print(sum(1,2,3,4))
# print(sum(3,6,1))

# print(sum.__doc__)

# # tham tri va tham chieu
# # Tham trị là truyền giá trị vào hàm

# def tong_2_so(a, b):
#     print("a = ", a)
#     print("b = ", b)
#     return a + b

# print(tong_2_so(4, 6))

# myList = ["Apple", "Banana", "Kiwi"]
# # Hàm sẽ thêm 1 phần tử vào danh sách

# def addItem(myTempList):
#     print('myTempList1 : ', myTempList)
#     myTempList += ["Mango"]
#     print('myTempList2 : ', myTempList)

# print("myList11 = ", myList)
# addItem(myList)
# print("myList22 = ", myList)

# bai tap tham chieu: Viet 1 chuong
# trinh loai bo phan tu lon nhat cua mang cho san

# a = [3,7,13,56,43,10]

# def xoa_phan_tu_max(myList):
#     max = myList[0];
#     for i in range(len(myList)):
#         if(myList[i]> max):
#             max = myList[i]
#     print(max)
#     myList.remove(max)
#     print(myList)

# print(a)
# xoa_phan_tu_max(a)

# bai tap 1: 

# def hien_thi( *number):
#     s = number
#     return s 

# print(hien_thi(3,5,7))

# #bai2
# def calculation(a,b):
#     tong = a + b
#     hieu = abs(a - b)
#     thuong = a / b
#     tich = a * b
#     print("tong la : ", tong)
#     print("hieu la : ", hieu)
#     print("tich la : ", tich)
#     print("thuong la : ", thuong)

# calculation(3,5)

#       bai4.5

# path_name = 'D:\\Python\\bai7\\romeo.txt'

# filename = open(path_name, 'r')
# wordlist = list()
# for line in filename:
#     words = line.split()
#     for word in words:
#         if word in wordlist:
#             continue
#         wordlist.append(word)

# wordlist.sort()
# print(wordlist)

#bai5.3
# def show_employee(name, salary = 9000):
#     print("Ten nhan vien: ", name)
#     print(f"Muc luong: {salary}$")

# show_employee("Nang")


