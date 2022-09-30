input = input("nhap vao 1 chuoi: ")
input.strip()

a = len(input)
c = ''
for i in range(-a,0):
    c+= str(input[i])

if(input == c):
    print("chuoi doi xung")
else:
    print("chuoi khong doi xung")


# lst = ["Honda", "Toyota", "Mazda"]


