# Flappy Bird Game using Flutter & Flame

![Screenshot 1](https://github.com/AnishHazra/Flappy-Bird-Game/assets/121759157/1387ecd9-b110-4141-ae52-ff25babebf05)
![Screenshot 2](https://github.com/AnishHazra/Flappy-Bird-Game/assets/121759157/344c430e-c0e9-4155-877e-728a8209ff56)
![Screenshot 3](https://github.com/AnishHazra/Flappy-Bird-Game/assets/121759157/23044898-9389-4a17-beba-fcc1a987c26f)

## Description

This project is a simple implementation of the classic Flappy Bird game using Flutter and Flame game development framework. It serves as a fun and educational example of building a mobile game with Flutter and Flame.

## Features

- Classic Flappy Bird gameplay mechanics.
- Simple and intuitive controls.
- Customizable settings (speed, difficulty, etc.).
- Score tracking and display.
- Responsive design for various screen sizes.

## Demo
https://youtube.com/shorts/MatDya8X0rQ?si=JOC5KvjMHGxIttC6

## Getting Started

These instructions will help you get a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- Flutter SDK installed. [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)
- A supported IDE (such as Visual Studio Code or Android Studio).

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/AnishHazra/Flappy_Bird_Game.git

2. Navigate to the project directory.
   ```bash
   cd Flappy_Bird_Game
   
3. Install dependencies.
   ```bash
   flutter pub get
   
4. Run the app.
   ```bash
   flutter run

## Usage
- Tap on the screen to make the bird jump.
- Navigate the bird through the pipes to score points.
- Avoid collision with the pipes and the ground.

## Customization
You can customize the game by adjusting parameters in the lib/game/game.dart file, such as speed, gravity, pipe spacing, etc.

```dart
// Example customization
final double birdJumpForce = -300.0;
final double gravity = 600.0;
final double pipeSpawnInterval = 2.0;
// ... other parameters
```
## Contributing
Feel free to contribute to the project by opening issues or submitting pull requests. Any contributions are highly appreciated!

## Acknowledgments
- Inspiration: Flappy Bird by Dong Nguyen
- Flame - A minimalist Flutter game engine
