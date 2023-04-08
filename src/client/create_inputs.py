from flet import TextField, Offset

from app_settings import AppSettings


class CreateInput(TextField, AppSettings):
    def __init__(
        self,
        placeholder: str,
        alignment,
        autofocus: bool = False,
        read_only: bool = False,
        offset_x: int = 0,
        offset_y: int = 0,
        text_size=None,
    ):
        self.placeholder = placeholder
        self.autofocus_input = autofocus
        self.read_only_input = read_only
        self.offset_x = offset_x
        self.offset_y = offset_y
        self.alignment = alignment
        self.text_size_input = text_size

        AppSettings.__init__(self)

    def _build(self):
        return TextField.__init__(
            self,
            hint_text=self.placeholder,
            autofocus=self.autofocus_input,
            read_only=self.read_only_input,
            offset=Offset(self.offset_x, self.offset_y),
            text_align=self.alignment,
            text_size=self.text_size_input,
        )

    def get_value(self):
        try:
            self.int_value = int(self.value)

        except ValueError as exc:
            raise ValueError(self.get_text_from_json(11)) from exc

        if self.int_value <= 0:
            raise ValueError(self.get_text_from_json(12))

        if self.int_value < 8:
            raise ValueError(self.get_text_from_json(13))

        if self.int_value > 128:
            raise ValueError(self.get_text_from_json(14))

        return self.int_value

    def set_value(self, new_value):
        self.value = new_value

    def change_placeholder(self, new_placeholder):
        self.hint_text = new_placeholder
