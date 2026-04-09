#2) You are given a string, remove all the duplicates and print the unique string.Use loop in the python.

def remove_duplicates(s):

    result=""
    for char in s:
        if char not in result:
            result+=char
    return result
print(remove_duplicates("programming"))
