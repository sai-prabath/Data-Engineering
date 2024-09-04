def capitalize_words(sentence):
    return sentence.title()

def reverse_string(s):
    return s[::-1]

def count_vowels(s):
    count = 0
    vowels = "aeiouAEIOU"
    for char in s:
        if char in vowels:
            count += 1
    return count

def is_palindrome(s):
    return s==s[::-1]




