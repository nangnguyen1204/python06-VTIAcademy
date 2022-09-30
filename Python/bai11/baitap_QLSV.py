
class student:
    id = 0
    name = " "
    age = 0
    country = " "
    major = " "
    _class = " "

    def __init__(self, _id, _name, _age, _country, _major, _class):
        self.id = _id
        self.name = _name
        self.age = _age
        self.country = _country
        self.major = _major
        self._class = _class

class student_list:
    listStudent = []

    def __init__(self):
        pass

    # Xem danh muc sinh vien
    def get_list_student(self):
        return self.listStudent

    # Xac dinh so luong sinh vien
    def get_number_student(self):
        return self.listStudent.__len__()

    #Ham tu dong tao ID sinh vien 
    def generateID(self):
        maxID = 1
        if(self.get_number_student() > 0):
            maxID = self.listStudent[0].id
            for st in self.listStudent:
                if(maxID < st.id):
                    maxID = st.id
            maxID = maxID + 1
        return maxID

    #Them sinh vien
    def input_student(self):
        stID = self.generateID()
        stName = input("Nhap ten sinh vien: ")
        stAge = input("Nhap tuoi: ")
        stCountry = input("Nhap dat nuoc: ")
        stMajor = input("Nhap chuyen nganh: ")
        stClass = input("Nhap lop : ")
        student = student(stID, stName, stAge, stCountry, stMajor, stClass)
        self.listStudent.append(student)

    #Tim Kiem sinh vien theo id
    def  findStudentID(self, id):

    #Tim Kiem sinh vien theo tu khoa
    def findStudentName(self, keyword):
    
    #Cap nhat sinh vien
    def updateStudent(self, id):

    #Xoa thong tin sinh vien 
    def delStudentID(self, id):

    # Sap xep thong tin sinh vien
    def sortStudent(self):

    # Hien thi danh sach sinh vien
    def showStudent(self, listStudent):
        
