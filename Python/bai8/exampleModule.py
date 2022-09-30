import calc_circle as x
import calc_square as y
import calc_rectangle as z


input = int(input("nhap cac so tu 1 - 3: "))

if(input == 1):
    # Tinh dien tich HCN
    print("dien tich hinh chu nhat: ", z.calc_rectangle(3,4))
elif (input == 2):
    # Tinh dien tich Hinh vuong
    print("dien tich hinh vuong: ", y.calc_square(4))
elif (input == 3):
    # Tinh dien tich hinh tron
    print("dien tich hinh tron: ",x.calc_circle(5))
else:
    print("ko thuoc chuc nang nao")