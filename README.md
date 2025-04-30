# PasswordGenerator

## Description

"Password Generator" is a desktop application that generates secure, random passwords based on user-specified length. The application allows users to create passwords between 8 and 128 characters, meeting modern security standards.

## Features

- **Custom Password Length**: Generate passwords between 8-128 characters
- **Random Character Selection**: Creates truly random and secure passwords
- **Cross-Platform**: Works seamlessly on Windows, macOS, and Linux
- **Easy-to-Use Interface**: Simple and intuitive design
- **Copy to Clipboard**: Easily copy generated passwords with one click
- **Multiple Language Support**: Interface available in multiple languages

## Installation

### Pre-built Binaries

Download the latest version for your operating system from the [Releases](https://github.com/RaulCatalinas/PasswordGenerator/releases) page.

### Building from Source

#### Requirements

- Go 1.24.2 or higher
- Wails CLI
- Bun (for frontend development)

#### Setup Development Environment

1. Install Go from the [official website](https://go.dev/dl/)
2. Install Wails CLI:

```bash
go install github.com/wailsapp/wails/v2/cmd/wails@latest
```

3. Clone the repository:

```bash
git clone https://github.com/yourusername/PasswordGenerator.git

#or
git clone git@github.com:yourusername/PasswordGenerator.git

#or
gh repo clone yourusername/PasswordGenerator

cd PasswordGenerator
```

4. Install dependencies:

```bash
  cd frontend
  bun i
```

#### Run in Development Mode

```bash
wails dev
```

#### Build for Production

```bash
wails build -platform windows,linux,darwin
```

## Technologies Used

- [Go](https://go.dev/) - For backend logic and password generation algorithms
- [Wails](https://wails.io/) - Framework for building desktop applications with Go and web technologies
- [React](https://reactjs.org/) (or your chosen frontend framework) - For the user interface

## Contributing

Thank you for considering contributing to the project! Here are some ways you can help:

1. **Report bugs** by creating issues in the GitHub repository
2. **Suggest new features** that would make the application more useful
3. **Improve documentation** by fixing errors or adding examples
4. **Submit code**:
   - Fork the repository
   - Commit your changes (`git commit -m 'Add some amazing feature'`)
   - Push (`git push`)
   - Open a Pull Request

## License

This project is licensed under the CC BY-NC-SA 4.0 License - see the [LICENSE](LICENSE) file for details.

## Connect with the Developer

- [Instagram](https://www.instagram.com/raulcatalinasesteban/)
- [Twitter](https://x.com/CatalinasRaul)
