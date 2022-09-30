

import random
from secrets import choice

class flashcard:
    animals = dict()
    
    #Ham khoi tao
    def __init__(self):
        self.animals = {
            'con ong'   : 'bee',
            'con thỏ'   : 'rabbit',
            'con cua'   : 'crab',
            'con mèo'   : 'cat',
            'con khỉ'   : 'monkey'
        }

    def quize(self):
        while(True):
            vi, en = random.choice(list(self.animals.items()))
            print("Tiếng Anh của '{}' là: ".format(vi))
            user_answer = input()
            if user_answer.lower() == en:
                print("That right!")
            else:
                print("Incorrect!!")

            option = int(input("Nhập 0 để tiếp tục: "))
            if option:
                break
        
        print("Finish")

obj = flashcard()
obj.quize()