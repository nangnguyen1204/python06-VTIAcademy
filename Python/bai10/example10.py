
# fi = open('D:\\Python\\bai10\\inFile.csv', encoding='UTF-8')
# fo = open('D:\\Python\\bai10\\outFile.csv','w', encoding='UTF-8')

# for line in fi:
#     hoten, diemM1, diemM2, diemM3 = line.split(',')
#     diemM1 = int(diemM1)
#     diemM2 = int(diemM2)
#     diemM3 = int(diemM3)
#     diemTB = (diemM1 + 2*diemM2 + 3*diemM3)/6
#     fo.write(f'{hoten}, {diemM1}, {diemM2}, {diemM3}, {round(diemTB,1)}\n')

# fi.close()
# fo.close()
    
# # Doc file JSON
# import json
# import os
# path_json = os.path.abspath("bai10//data.json")
# path_json = path_json.replace(os.sep, '//')

# f = open(path_json, encoding='UTF-8')

# #return a oblect json as dictionary
# # data = json.load(f)
# data = json.loads(f.read())

# # duyet cac item trong file json
# for i in data["emp_details"]:
#     print(i)
#     print(i['emp_name'])

# #close file
# f.close()

# Viet file JSON


# dict = {
#     "name" : "Nguyen Van A",
#     "year" : 28,
#     "sex"  : "male",
#     "mobile": "0460493994" 
# }
# path_json = os.path.abspath("bai10//sample.json")
# path_json = path_json.replace(os.sep, '//')
# # initate json file
# json_object = json.dumps(dict, indent = 4)

# # write to sample.json
# with open(path_json, 'w') as outfile:
#     outfile.write(json_object)

# lap trinh huong doi tuong OOP

