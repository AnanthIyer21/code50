from cs50 import get_int

height = 9

while height > 8 or height < 1:
    height = get_int("How tall is your half pyramid? ")

for i in range(height):
    print(" " * (height - (i+1)) + "#" * (i + 1) + "  " + "#" * (i + 1))
    
