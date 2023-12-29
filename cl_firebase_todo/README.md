# TODO App with Firebase Integration

A simple mobile application for managing your tasks using Flutter, Firebase Authentication, and Firestore Database.

## Features

- **User Authentication**: Utilizes Firebase Authentication for secure user sign-in and registration.
- **Real-time Task Management**: Store, update, and delete tasks using Firestore database in real-time.
- **Intuitive Interface**: Easily add, view, and manage tasks through a user-friendly interface.

## Screenshots

![Screenshot 1](cl_firebase_todo/assets/screenshots/todo1.jpg)
![Screenshot 1](cl_firebase_todo/assets/screenshots/todo2.jpg)
![Screenshot 1](cl_firebase_todo/assets/screenshots/todo3.jpg)
![Screenshot 1](cl_firebase_todo/assets/screenshots/todo4.jpg)
![Screenshot 1](cl_firebase_todo/assets/screenshots/todo5.jpg)
![Screenshot 1](cl_firebase_todo/assets/screenshots/todo6.jpg)
![Screenshot 1](cl_firebase_todo/assets/screenshots/todo7.jpg)


## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/todo-app.git
   ```

2. Navigate to the project directory:
   ```bash
   cd todo-app
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Setup Firebase:
   - Create a Firebase project and enable Firestore and Authentication.
   - Download `google-services.json` and place it in the `/android/app` directory.
   - Follow the Firebase setup guidelines for Android and iOS platforms.

5. Run the app:
   ```bash
   flutter run
   ```

## Firebase Configuration

For Firebase integration, ensure you've set up the following configurations:

- Firebase Authentication: Enable required sign-in methods (e.g., Email/Password).
- Firestore Database: Structure your database collections and permissions accordingly.

## Contributing

Contributions are welcome! If you'd like to improve or add features to this app, feel free to submit a pull request.
