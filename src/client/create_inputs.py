from flet import TextField, Offset


class CreateInput(TextField):
    def __init__(
        self,
        placeholder: str,
        autofocus: bool = False,
        read_only: bool = False,
        offset_x: int = 0,
        offset_y: int = 0,
    ):
        self.placeholder = placeholder
        self.autofocus_input = autofocus
        self.read_only_input = read_only
        self.offset_x = offset_x
        self.offset_y = offset_y

    def _build(self):
        return super().__init__(
            hint_text=self.placeholder,
            autofocus=self.autofocus_input,
            read_only=self.read_only_input,
            offset=Offset(self.offset_x, self.offset_y),
        )

    def get_value(self):
        try:
            self.int_value = int(self.value)

        except ValueError as exc:
            raise ValueError("Invalid input. Please enter a numeric value") from exc

        if self.int_value > 100:
            raise ValueError(
                "The password length is too long, please reduce the password length"
            )

        return self.int_value

    def set_value(self, new_value):
        self.value = new_value

    def change_placeholder(self, new_placeholder):
        self.hint_text = new_placeholder
