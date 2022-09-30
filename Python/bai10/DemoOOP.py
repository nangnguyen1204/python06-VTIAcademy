# #class trong python
# class className:
#     #ham khoi tao doi tuong
#     def __init__(self, _var1, _var2):
#         self.var1 = _var1
#         self.var2 = _var2

#     #cac phuong thuc ham
#     def method1(self,...):
#         #noi dung ham 1

#     def method2(self,...):
#         #noi dung ham 2

class person:
    def __init__(self, name, address, year):
        self.name = name
        self.address = address
        self.year = year

    def sayHello(self):
        print('Xin chao, ten toi la ', self.name)
    
    def updateAddress(self, newAddress):
        self.address = newAddress

# Khoi tao va su dung doi tuong
# cu phap:
# obj = className(var1,var2,...)

obj = person("Nguyen Van A", "Ha Noi", 35)

obj.sayHello()
print("old address : ", obj.address)
obj.updateAddress("Ha Tay")
print("new address : ", obj.address)

# truy nhap thuoc tinh doi tuong

obj.name = "Nguyen Huy Tuong"
obj.sayHello()