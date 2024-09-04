from MyModules import *
'''
printName("sai")
print(add(2,3))
print(subtract(22,3))
print(multiply(12,31))
print(divide(10,3))
'''

from string_utils import *
'''
print(capitalize_words("atomic habits"))
print(reverse_string("hello world"))
print(count_vowels("big brOwn fox"))
print(is_palindrome("1001"))
'''

from MyPackage import * # define __all__ in __init__ to use *
#from MyPackage import geomentry

print(arithmetic.add(10,30))
print(geomentry.area_circle(6))
