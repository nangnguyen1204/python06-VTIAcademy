class Person:
    name = []

    def set_name(self, user_name):
        self.name.append(user_name)
        return len(self.name) - 1

    def get_name(self, user_id):
        if user_id >= len(self.name):
            return 'Khong co user nao phu hop'
        else:
            return self.name[user_id]
    
if __name__ == '__main__':
    person = Person()
    print("User co ten Nguyen Van A duoc set: ", person.set_name('Nguyen Van A'))
    print("User voi id 0 co ten la: ", person.get_name(0)) 

