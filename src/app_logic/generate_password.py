from random import choice
from string import ascii_lowercase, ascii_uppercase, digits, punctuation


class GeneratePassword:
    def __init__(self):

        self.numbers = digits
        self.lowercase = ascii_lowercase
        self.uppercase = ascii_uppercase
        self.symbols = punctuation

        self.total_password = (
            self.lowercase + self.uppercase + self.symbols + self.numbers
        )

    def generate(self, password_length, page):
        self.password = "".join(
            choice(self.total_password) for i in range(password_length)
        )

        page.set_clipboard(self.password)

        return self.password
