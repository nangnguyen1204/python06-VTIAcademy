
print("Get the number of hours worked")
hour_work = float(input())

print("Get the hourly pay rate")
pay_rate = float(input())

if hour_work > 40:
    c = hour_work *1.5
    gross_pay = c * pay_rate
    print("gross pay: ", gross_pay)
else :
    gross_pay = hour_work * pay_rate
    print("gross pay: ", gross_pay)
