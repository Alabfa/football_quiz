# Football Quiz

A simple Flutter-based quiz app that helps you test your knowledge about football team flags. The app supports two languages: Arabic and English. Users are presented with a football team's flag and four choices. Only one choice is correct. After finishing the quiz, users see their results. Currently, it supports Premier League and La Liga clubs only.

## Features

- Language support for Arabic and English
- Quiz format with a team flag, four choices, and remaining questions number
- Support for Premier League and La Liga
- Displays the user’s score at the end of the quiz
- Simple and minimal animations
- Caches the selected language to persist when the app is restarted

## Structure

The app follows the MVC+U architecture pattern with GetX for state management:

### Directory Structure:
```plaintext
lib
│
├── core
│   ├── controllers       # Logic and business logic (GetX controllers)
│   ├── models            # Data models representing the quiz
│   └── services          # Services for storage (cache)
│
├── l10n                  # Localization files for Arabic and English
│
├── utils                 # Utility functions for general app needs
│
└── view                  # UI related files (widgets, screens)
```

## Getting Started

To get a local copy of the project up and running, follow these steps:

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) (version 3.27.1 or higher)
- Dart (comes with Flutter)
- An IDE (e.g., Visual Studio Code, Android Studio)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/alabfa/football-quiz.git
   ```

2. Navigate to the project directory:
   ```bash
   cd football-quiz
   ```

3. Install the dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app on your emulator or connected device:
   ```bash
   flutter run
   ```

### Running on iOS

If you're developing on macOS and want to run the app on an iOS device or simulator, make sure you have Xcode installed. Then, run:
```bash
flutter run -d ios
```

### Running on Android

To run on an Android emulator or device, ensure that you have Android Studio set up. Then, run:
```bash
flutter run -d android
```

## Localization

The app supports both **Arabic** and **English**. You can switch between the languages from the app.

## Contributions

Contributions are welcome! Feel free to fork the repository and submit issues.

## License

This project is open-source and available under the [MIT License](LICENSE).
