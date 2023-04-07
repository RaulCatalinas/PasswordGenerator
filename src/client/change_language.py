"""Control the logic to be able to change the language of the app"""

from flet import Dropdown, dropdown, alignment, Offset

from app_settings import AppSettings


class ChangeLanguage(Dropdown, AppSettings):
    """Allows the user to change the language of the app"""

    def __init__(
        self,
        appbar,
        page,
        input_length_password,
        input_password_generated,
        close_dialog,
        dropdown_contact,
        icon_language,
        icon_theme,
        button_generate_password,
        button_exit_the_app,
    ):
        self.appbar = appbar
        self.page = page
        self.input_length_password = input_length_password
        self.input_password_generated = input_password_generated
        self.close_dialog = close_dialog
        self.dropdown_contact = dropdown_contact
        self.icon_language = icon_language
        self.icon_theme = icon_theme
        self.button_generate_password = button_generate_password
        self.button_exit_the_app = button_exit_the_app

        AppSettings.__init__(self)

    def _build(self):
        return Dropdown.__init__(
            self,
            options=[
                dropdown.Option(self.get_config_excel(4)),
                dropdown.Option(self.get_config_excel(5)),
            ],
            value=self.get_language(),
            visible=False,
            alignment=alignment.center,
            on_change=lambda e: self.__change_language(),
        )

    def change_visibility_dropdown_language(self):
        """Show or hide the dropdown if it is hidden or not respectively"""

        if not self.visible:
            self.visible = True
            self.appbar.toolbar_height = 114
            self.icon_language.offset = Offset(6.50, 0.3)
            self.icon_theme.offset = Offset(0, -0.65)

            return self.page.update(self, self.appbar)

        self.visible = False
        self.icon_language.offset = Offset(0, 0.3)

        if not self.dropdown_contact.visible:
            self.appbar.toolbar_height = 63
            self.icon_theme.offset = Offset(0, 0)

        return self.page.update(self, self.appbar)

    def __change_language(self):
        """Change the language of the app, update the texts of the app and update the environment variable to the chosen language"""

        if self.value in ["Spanish", "Español"]:
            self.set_language("Español")

        else:
            self.set_language("English")

        self.visible = False

        self.options = [
            dropdown.Option(self.get_config_excel(4)),
            dropdown.Option(self.get_config_excel(5)),
        ]
        self.value = self.get_language()

        self.input_length_password.change_placeholder(self.get_config_excel(8))
        self.input_password_generated.change_placeholder(self.get_config_excel(9))
        self.button_generate_password.change_text_button(self.get_config_excel(10))

        self.close_dialog.update_text(
            text_title=self.get_config_excel(6), text_content=self.get_config_excel(0)
        )
        self.button_exit_the_app.change_text_button(self.get_config_excel(1))

        self.dropdown_contact.hint_text = self.get_config_excel(7)

        self.icon_language.offset = Offset(0, 0.3)

        if not self.dropdown_contact.visible:
            self.appbar.toolbar_height = 63
            self.icon_theme.offset = Offset(0, 0)

        return self.page.update(
            self.appbar,
            self.input_length_password,
            self.input_password_generated,
            self,
            self.dropdown_contact,
            self.button_generate_password,
            self.button_exit_the_app,
        )
