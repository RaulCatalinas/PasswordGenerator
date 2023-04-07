from flet import Text


class CreateText(Text):
    def __init__(self, text, size_text):
        self.text = text
        self.size_text = size_text

        super().__init__(value=self.text, size=self.size_text, font_family="Arial")

    def change_text(self, new_text):
        self.value = new_text
