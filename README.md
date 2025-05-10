# Weather App

A cross-platform weather application built using Flutter. This app provides weather updates and forecasts with a modern and intuitive user interface.

## Features

- Displays current weather conditions.
- Provides weather forecasts for multiple days.
- Supports multiple platforms, including Android, iOS, Windows, Linux, macOS, and Web.
- Dark theme enabled by default.

## Images

![Weather Screen](images/weatherScreen.png)

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) installed on your system.
- A code editor like [Visual Studio Code](https://code.visualstudio.com/) with the Flutter extension installed.

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/nuwahereza-eng/weather_app.git
   cd weather_app
   ```bash

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Run the app:

   ```bash
   flutter run
   ```

## Project Structure

```bash
weather_app/
├── lib/
│   ├── main.dart          # Entry point of the application
│   ├── weather_screen.dart # Main screen displaying weather information
├── android/               # Android-specific files
├── ios/                   # iOS-specific files
├── linux/                 # Linux-specific files
├── macos/                 # macOS-specific files
├── windows/               # Windows-specific files
├── web/                   # Web-specific files
├── test/                  # Unit and widget tests
├── pubspec.yaml           # Project dependencies and metadata
└── README.md              # Project documentation
```

## Development

### Adding New Features

1. Create a new branch:

   ```bash
   git checkout -b feature/your-feature-name
   ```

2. Make your changes and commit:

   ```bash
   git commit -m "Add your feature description"
   ```

3. Push your branch and create a pull request:

   ```bash
   git push origin feature/your-feature-name
   ```

### Running Tests

Run the following command to execute tests:

```bash
flutter test
```

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request for any enhancements or bug fixes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Flutter](https://flutter.dev/) for providing an amazing framework for cross-platform development.
- Weather API provider (openweather.org).

bash

Replace `https://github.com/your-username/weather_app.git` with the actual URL of your repository and update the "Acknowledgments" section with the weather API you are using, if applicable.
   flutter pub get
