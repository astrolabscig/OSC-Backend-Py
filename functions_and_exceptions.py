# FUNCTIONS
def greet():
    print("Hello good evening")


def calculate_mean(num_list: list):
    sum = 0
    for i in num_list:
        sum += i
    
    mean = sum / len(num_list)
    return mean

some_list = [1, 3, 6, 9, 7, 4]
print(calculate_mean(some_list))

def user(name: str, age: int, email: str ):
    return f"Welcome {name}, since you are {age} years, you are eligible and an email has been sent to {email}"
    

# EXCEPTIONS
# try and except is used to handle exceptions
def calculate_sum(num_one: int, num_two: int) -> int:
    try:
        sum_of_numbers = num_one + num_two
    except TypeError:
        print("Inputs must be a number")
        return 0
    else:
        print("Addition successful")
        return sum_of_numbers


# Taking input from terminal
try:
    age = int(input("Enter your age: "))
    year_of_birth = 2026 - age
    print(year_of_birth)
except ValueError:
    print("Age is expected to be a number")


# Raising ValueError
def check_age(age: int):
    if age < 18:
        raise ValueError("Age must be greater than 18")
    return "Access granted"

# ZeroDivisionError
try:
    divide = 5/0
    print(divide)
except ZeroDivisionError:
    print("You cannot divide by 0")