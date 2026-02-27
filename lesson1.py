
#variables

# variable nameing
#camel_Case
nameofPerson = "Joe"
print(nameofPerson)

# '+' : addition
# '-' : subtraction
# '*' : multiplication
# '**' : power

pi = 22/7
radius = 7
area_of_circle = pi * radius ** 2
print(area_of_circle)

# Data Types
# language automatically ID the data type of the variable
# - string => str
student_name = "James"

# - integer => int
student_age = 18

# - float
area = 23.14567

# - boolean => bool (either True or False)
is_student = False 
is_HOD = True 

# list => list
fruits = ["apple", "mango", "watermelon"]
print(f"\nThe datatype of {fruits} is :", type(fruits))

scores = [90, 70, 43]

cwas = [67.8, 71.67, 82.24]

# dictionary => dict
student_data = {"name": "Marvin", "age": 22, "class": "CS4"}
print(f"The datatype of {student_data} is: ", type(student_data))

# conditional statements
# - if-else
if(student_age >= 18):
    print("You are an adult")
else:
    print("You are not an adult")

# for loop
cwas = [67.8, 71.67, 82.24]
for cwa in cwas:
    if (cwa >= 70.00):
        print(f"CWA is {cwa}: First Class")
    elif (cwa >= 60.00):
        print(f"CWA is {cwa}: Second Class upper")
    elif (cwa >= 50.00):
        print(f"CWA is {cwa}: Second Class lower")
    else:
        print(f"CWA is {cwa}: Pass")