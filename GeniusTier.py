import random
import string

# input
input_string = input("Enter your favorite two words and one number:\n ")

# split into lists
data = input_string.split(",")
special_character = []

first_input = data[0]
second_input = data[1]
third_input = data[2]

first_input.split()
second_input.split()
third_input.split()

final_password = ""


# capitalize function
def capitalize_nth(n):
    return n.capitalize()


# joining to words without changing order
def algo_shuffle(p, q):
    r = [iter(p)] * len(p) + [iter(q)] * len(q)
    random.shuffle(r)
    r = [next(i) for i in r]
    return r


# combine 2 words
final_password_split = algo_shuffle(first_input, second_input)
# capitalize
for i in (1, 2, 3):
    j = random.randint(0, len(final_password_split) - 1)
    final_password_split[j] = capitalize_nth(final_password_split[j])

# combine password with third input
final_password_split = algo_shuffle(final_password_split, third_input)

# adding special characters
for i in (0, 1, 2):
    special_character.append(random.choice(string.punctuation))
    print(special_character[i])
final_password_split = algo_shuffle(final_password_split, special_character)

# reducing password to 12 characters
if len(final_password_split) > 12:
    char_to_remove = len(final_password_split) - 12
    final_password_split = final_password_split[:-char_to_remove]

# final password input
final_password = "".join(final_password_split)

print("\n" + final_password)
