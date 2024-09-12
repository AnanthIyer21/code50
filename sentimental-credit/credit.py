from cs50 import get_int
# get user input
number = get_int("Number: ")
# initialise length of the number to 0
length = 0
# create an array of the digits of the number
digits = []

# function to find the length of the number and create an array of the digits of the number
for i in str(number):
    length += 1
    digits.append(int(i))

total = 0

if length % 2 == 0:
    for i in range(int(length/2)):
        total += digits[2 * i] * 2
    for j in range(int(length/2)):
        total += digits[2 * (i + 1) - 1]
else:
    for k in range(int(length/2)):
        total += digits[2 * (k + 1) - 1]
    for l in range(int(length/2) + 1):
        total += digits[2 * l] * 2

if total % 10 == 0:
    if digits[0] == 4 and (length == 13 or length == 16):
        print("VISA")
elif digits[0] == 3 and (digits[1] == 3 or digits[1] == 7) and length == 15:
    print("AMEX")
elif digits[0] == 5 and (digits[1] == 1 or digits[1] == 2 or digits[1] == 3 or digits[1] == 4 or digits[1] == 5) and length == 16:
    print("MASTERCARD")
else:
    print("INVALID")
