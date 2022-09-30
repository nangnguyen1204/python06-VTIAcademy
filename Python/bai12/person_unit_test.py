import unittest

import Person as PersonClass

class test(unittest.TestCase):
    """
       Basic Class thừa kế unittest.TestCase  
    """
    person = PersonClass.Person()
    user_id = [] # Bien de luu tru user_id
    user_name = [] # bien luu tru person name

    # Test case function de check Person.set_name

    def test_0_set_name(self):
        print("Start set_name test")
        """
             Hàm sử dụng bắt đầu bằng test_ được coi như là 1 test case
        """
        for i in range(4):
            # KHoi tao 1 name
            name = 'name' + str(i)
            # Luu ten vao trong list
            self.user_name.append(name)
            # get user id tu func
            user_id = self.person.set_name(name)

            #check xem user_id la null hay ko 
            self.assertIsNotNone(user_id)

            # luu user_id vao list
            self.user_id.append(user_id)

        print("user_id length = ", len(self.user_id))
        print(self.user_id)
        print("user_name length = ", len(self.user_name))
        print(self.user_name)
        print("finish set_name test")

    def test_1_get_name(self):
        print("start get_name test")

        # Tong so thong tin user duoc luu
        length = len(self.user_id)
        print("user_id length = ", length)
        print("user_name length = ", len(self.user_name))
        for i in range(6):
            #neu i ko vuot qua tong so user_id duoc xac thuc
            if i < length:
                #kiem tra co trung voi nhau ko 
                self.assertEqual(self.user_name[i], self.person.get_name(self.user_id[i]))
            else:
                print("testing for get_name no user test")
                self.assertEqual("Khong co user nao phu hop", self.person.get_name(i))

            print("Finish get_name test")


if __name__ == '__main__':
    unittest.main()
