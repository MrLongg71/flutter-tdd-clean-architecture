# App Architecture

This sample follows BLoC pattern + Clean Architecture.

## Stack

- Flutter

- [Bloc](https://bloclibrary.dev) for state management

- [get_it](https://pub.dev/packages/get_it) for dependency injection

## Installation

This app was created and tested on `Flutter 3.0.0` and `Dart 2.17.0` .

```
git clone https://github.com/MrLongg71/flutter-tdd-clean-architecture.git
cd flutter-tdd-clean-architecture
flutter packages get
```

For debug mode run `flutter run` and for production mode run `flutter run --release`

To run the code generator using `freezed`, run `flutter pub run build_runner watch --delete-conflicting-outputs`.

To run the code generator using `json_serializable`, run `flutter pub run build_runner build --delete-conflicting-outputs` 

To run the code generator using `injectable_generator`, run ` flutter packages pub run build_runner watch` 