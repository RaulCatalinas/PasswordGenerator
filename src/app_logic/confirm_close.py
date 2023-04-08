"""Control the closing of the app"""

from flet import MainAxisAlignment

from client.app_settings import AppSettings
from client.create_buttons import CreateElevatedButton, CreateOutlinedButton
from client.create_dialog import CreateDialog


class ConfirmClose(CreateDialog, AppSettings):
    """Control the closing of the app"""

    def __init__(self, page):
        AppSettings.__init__(self)

        self.button_exit_the_app = CreateElevatedButton(
            text=self.get_text_from_json(1),
            function=lambda e: self.__exit(page),
        )

        self.button_cancel_exit_the_app = CreateOutlinedButton(
            text="No", function=lambda e: self.__cancel(page)
        )

        self.title_dialog = self.get_text_from_json(6)
        self.content_dialog = self.get_text_from_json(0)

        CreateDialog.__init__(
            self,
            icon=False,
            title_dialog=self.title_dialog,
            title_size=25,
            content_dialog=self.content_dialog,
            content_size=19,
            actions_dialog=[self.button_exit_the_app, self.button_cancel_exit_the_app],
            actions_alignment_dialog=MainAxisAlignment.END,
        )

    def __exit(self, page):
        self.change_state(page)
        page.window_destroy()

    def __cancel(self, page):
        return self.change_state(page)

    def change_state_close_dialog(self, page):
        return self.change_state(page)

    def update_text_dialog(self, text_title: str, text_content: str) -> None:
        self.update_text(text_title=text_title, text_content=text_content)
