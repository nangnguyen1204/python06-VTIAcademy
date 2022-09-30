print("salary")
salary = int(input())

if salary < 30000:
    print("you must earn at least 30000")
else:
    print("year on job")
    year_on_job = int(input())
    if year_on_job < 2:
        print("at least 2 year")
    else:
        print("you quality for the loan")