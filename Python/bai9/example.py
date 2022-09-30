# lệnh mở file
# doc file
import os

# f = open(<file_name>, <mode>, encoding= <encoding>)
path = os.path.abspath("bai9//romeo.txt")
path = path.replace(os.sep, '//')
# print(path)

# f = open(path, 'r')
# # data = f.read()
# # print(data)

# # doc toan bo dong cua file == > readline()

# lines = f.readlines()
# print(lines)

# #doc tung dong
# for line in lines:
#     print(line)
# f.close()
# ghi file

# f1 = open(path, 'w')
# str = "cau them"
# f1.write(str)

# f1.close()

# truy xuat file ==> su dung cau truc with

# with open(path + "test.txt", 'w' ) as f:
#     f.write("Viet nam que huong toi\n")
#     f.write("Viet Nam hihi\n")

# Bai tap:
#B1: doc 1 file van ban, tao ra 1 file moi chua cac dong file nguon 
# bo khoang trong
infile = open(path, 'r')
path2 = os.path.abspath("bai9//output.txt")
outfile = open(path2, 'w')

for line in infile:
    if line.strip() != ' ':
        outfile.write(line)

infile.close()
outfile.close()