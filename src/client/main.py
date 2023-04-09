"""Start the app"""

from threading import Thread

from flet import (
    app,
    Page,
    CrossAxisAlignment,
    MainAxisAlignment,
    icons,
    TextAlign,
    KeyboardEvent,
)

from app_logic.confirm_close import ConfirmClose
from app_logic.generate_password import GeneratePassword
from app_settings import AppSettings
from create_buttons import CreateElevatedButton
from create_dialog import CreateDialog
from create_inputs import CreateInput
from taskbar import TaskBar


class Main(AppSettings):
    """Start the app"""

    def __init__(self, page: Page):
        super().__init__()

        self.set_environment_variable(page)

        self.confirm_close = ConfirmClose(page)

        page.title = "Password Generator"
        page.window_width = 1200
        page.window_height = 400

        page.window_center()

        page.window_maximizable = False
        page.window_resizable = False

        page.theme_mode = page.client_storage.get("theme")

        page.horizontal_alignment = CrossAxisAlignment.CENTER
        page.vertical_alignment = CrossAxisAlignment.CENTER

        page.window_prevent_close = True

        self.button_close_dialog = CreateElevatedButton(text="Ok", function=None)

        self.error_dialog = CreateDialog(
            icon=True,
            title_dialog=icons.ERROR,
            content_dialog="",
            title_size=1.3,
            content_size=25,
            actions_dialog=[self.button_close_dialog],
            actions_alignment_dialog=MainAxisAlignment.END,
        )

        def __event_close_window(event):
            if event.data == "close":
                self.__overlay(page)
                page.dialog = self.confirm_close

                if self.error_dialog.open:
                    self.error_dialog.change_state(page)

                self.confirm_close.change_state_close_dialog(page)

        def __keyboard_event(event: KeyboardEvent):
            if event.key == "Enter":
                self.__generate(page)

        page.on_window_event = __event_close_window
        page.on_keyboard_event = __keyboard_event

        self.generate_password = GeneratePassword()

        self.input_length_password = CreateInput(
            placeholder=self.get_text_from_json(8),
            autofocus=True,
            alignment=TextAlign.CENTER,
            text_size=20,
        )

        self.input_password_generated = CreateInput(
            placeholder=self.get_text_from_json(9),
            read_only=True,
            offset_y=0.5,
            alignment=TextAlign.CENTER,
            text_size=18,
        )

        self.button_generate_password = CreateElevatedButton(
            text=self.get_text_from_json(10),
            function=lambda e: self.__generate(page),
            offset_y=1,
        )

        self.taskbar = TaskBar(
            page=page,
            input_length_password=self.input_length_password,
            input_password_generated=self.input_password_generated,
            close_dialog=self.confirm_close,
            button_generate_password=self.button_generate_password,
            button_exit_the_app=self.confirm_close.button_exit_the_app,
        )

        Thread(target=self.__add, args=[page], daemon=False).start()
        Thread(target=self.__overlay, args=[page], daemon=False).start()

    def __generate(self, page):
        try:
            self.password_generated = self.generate_password.generate(
                self.input_length_password.get_value()
            )
            self.input_password_generated.set_value(self.password_generated)
            page.update(self.input_password_generated)

        except Exception as value_error:
            self.__show_dialog(page=page, error=value_error)

    def __show_dialog(self, page, error):
        self.button_close_dialog.on_click = lambda e: self.error_dialog.change_state(
            page
        )
        self.error_dialog.content_text.change_text(error)

        self.__overlay(page)
        page.dialog = self.error_dialog

        self.error_dialog.change_state(page)

    def __add(self, page):
        ITEMS_TO_ADD_TO_THE_PAGE = [
            self.input_length_password,
            self.input_password_generated,
            self.button_generate_password,
            self.taskbar,
        ]

        for item in ITEMS_TO_ADD_TO_THE_PAGE:
            page.add(item)

    def __overlay(self, page):
        TO_ADD_TO_THE_OVERLAY_OF_THE_PAGE = [
            self.confirm_close,
            self.error_dialog,
        ]

        for i in TO_ADD_TO_THE_OVERLAY_OF_THE_PAGE:
            page.overlay.append(i)


app(target=Main)
