#lambdas
# Cu phap:
# h = lambda a: a * a
# Giai thich:
# lambda : keywords
# a: argument
# a*a : expression


# my_list = [1,2,3,4,5,6,7,8,9]
# result = lambda x: x*2

# print(result(3))

# y = lambda a: a + 10
# print(y(30))

# z = lambda x1, y1: x1 * y1
# print(z(4,8))

# input = int(input("Nhap x:  "))
# ret = lambda x : "Chan " if x%2 == 0 else "Le"
# print(ret(input))

#cu phap toan tu 3 ngoi
# true_expression if condition else false expression

# baitap: su dung toan tu 3 ngoi ket hop lambda tim gia tri lon nhat 
#cua 2 so a,b nhap vao tu ban phim

# x1 = int(input("Nhap a: "))
# x2 = int(input("Nhap b: "))

# find_max = lambda a,b : a if (a - b)>= 0 else b

# print(find_max(x1,x2))

# from email.mime import base


# number_list = [2,0,5,7,3,5]

# lst = sorted(number_list, key= lambda number_list: number_list)
# print(lst)

# scientists = ['Marie Curie', 'Albert Einstein', 'Rosalind Franklin', 'Niels Bohr', 'Dian Fossey', 'Isaac Newton', 'Grace Hopper', 'Charles Darwin', 'Lise Meitner']
# print(scientists)
#scientists = sorted(scientists, key=lambda name: name.split()[-1])
#print(scientists)

#               hypervolume

# def print_arg(arg1, arg2, *args):
#     print(arg1)
#     print(arg2)
#     print(args)

# t = [1,2,3,4,5]
# print_arg(*t)

# def trace(f, *args, **kwargs):
#     print("arg= ", args)
#     print("kwarg= ", kwargs)
#     result = f(*args, **kwargs)
#     print("result: ", result)
#     return result

# trace(int, "ff" , base= 16)

#           FUNCTION DECORATOR

#Vi du Function Decorator

# def myDecorator(a):
#     def myInnerDecorator():
#         print("Inside Decorator")
#         a()
#     return myInnerDecorator

# @myDecorator
# def myFunc():
#     print("Hello World")

# myFunc()

#       Ham MAP()
# Cu phap:
# map(function, iterable, ...)
# + function: la ham thuc thi cho tung phan tu iterable
# + iterable : la 1 list, tuple, dictionary muon duyet

# def binh_phuong(x):
#     return x*x

# number = [10,15,20,25]
# ket_qua = map(binh_phuong, number)

# # chuyen map object thanh list
# print(list(ket_qua))

#            HAM FILTER()
# from unittest import result


# alphabet = ['a', 'b', 'c', 'd', 'e', 'f', 'i', 'j', 'k']

# def filter_nguyen_am(alphabet):
#     nguyen_am = ['a', 'i', 'o', 'u', 'e']
#     if alphabet in nguyen_am:
#         return True
#     else:
#         return False
    
# result = filter(filter_nguyen_am, alphabet)

# for x in result:
#     print(x)

#           HAM CHAIN()
# from itertools import chain


# list1 = [1,3,5,7,9]
# list2 = [0,2,4,6,8]

# number = list(chain(list1, list2))

# print(number)

# HAM ZIP(): ham nen

# HAM REDUCE()




