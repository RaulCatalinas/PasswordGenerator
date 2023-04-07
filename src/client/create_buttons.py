from flet import ElevatedButton, Offset, OutlinedButton, IconButton


class CreateIconButton(IconButton):
    def __init__(self, icon_button, function, offset_button=None, scale_button=1):
        self.icon_button = icon_button
        self.function = function
        self.offset_button = offset_button
        self.scale_button = scale_button

        super().__init__(
            icon=self.icon_button,
            on_click=self.function,
            scale=self.scale_button,
            offset=self.offset_button,
        )

    def change_state(self, page):
        """If the button is activated, it deactivates it and vice versa"""

        if not self.disabled:
            self.disabled = True

        else:
            self.disabled = False

        return page.update(self)


class CreateElevatedButton(ElevatedButton):
    def __init__(
        self,
        text: str,
        function,
        offset_y: int = 0,
        offset_x: int = 0,
    ):
        self.text_button = text
        self.function = function
        self.offset_x = offset_x
        self.offset_y = offset_y

        super().__init__(
            text=self.text_button,
            on_click=self.function,
            offset=Offset(self.offset_x, self.offset_y),
        )

    def change_text_button(self, new_text):
        self.text = new_text

    def change_state(self, page):
        """If the button is activated, it deactivates it and vice versa"""

        if not self.disabled:
            self.disabled = True

        else:
            self.disabled = False

        return page.update(self)


class CreateOutlinedButton(OutlinedButton):
    def __init__(self, text: str, function, offset_y: int = 0, offset_x: int = 0):
        self.text_button = text
        self.function = function
        self.offset_x = offset_x
        self.offset_y = offset_y

        super().__init__(
            text=self.text_button,
            on_click=self.function,
            offset=Offset(self.offset_x, self.offset_y),
        )

    def change_text_button(self, new_text):
        self.text = new_text

    def change_state(self, page):
        """If the button is activated, it deactivates it and vice versa"""

        if not self.disabled:
            self.disabled = True

        else:
            self.disabled = False

        return page.update(self)
