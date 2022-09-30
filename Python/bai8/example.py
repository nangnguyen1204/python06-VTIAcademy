#handle exepction

# def divide(a,b):
#     try:
#         s = a/b
#     except ZeroDivisionError:
#         print("Mau khong the bang 0")
#     return s

# print("a/b = ", divide(3,0))

# import math

# def can_bac_hai(a):
#     try:
#         s  = math.sqrt(a)
#     except KeyError:
#         print("Bien undefined")
#     except NameError:
#         print("available undefined")
#     except:
#         print("khong the khai bao so am")
#     finally:
#         print("try except finish")
#         return s

# print(can_bac_hai(-4))

# 26 tap loi

# colors = ["red", "greem", "yellow"]

# try:
#     print(colors[3])
# except ( IndexError, LookupError, NameError) as e:
#     print(f"Error {e} !")

#raise exception

# try: 
#     x = int(input("nhap vao tu ban phim: "))
#     if x>100:
#         raise ValueError(x)
# except ValueError:
#     print(x, " is out of range")
# else:
#     print(x, " in range allowed")


