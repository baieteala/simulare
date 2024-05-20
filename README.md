# Roguelike Adventure Game

Welcome to the **Roguelike Adventure Game** repository! This game is a roguelike adventure created using the Godot engine. In this game, you will battle various monsters through three different rooms, culminating in an epic final boss fight.

## Features

    - **Three Unique Rooms**: Each room offers a distinct challenge and a variety of monsters to defeat.
    - **Final Boss Battle**: The last room features a challenging boss that requires strategy and skill to defeat.
    - **Advanced Gameplay Mechanics**:
        - **Collision Detection**: Ensures realistic interactions between the player, enemies, and the environment.
        - **Finite State Machines**: Used to manage enemy behaviors and transitions between different states.

## Getting Started

### Requirements

- **Godot Engine**: Make sure you have the Godot engine installed on your system. You can download it from [here](https://godotengine.org/download).

### Installation

1. **Clone the Repository**:
   Open your terminal or command prompt and run the following command:
   ```sh
   git clone https://github.com/baieteala/simulare.git

2. **Open the Project in Godot**:
    Launch the Godot engine.
    In the project manager, click on the Import button.
    Navigate to the location where you cloned the repository and select the project.godot file.
    Click on Open and then on Import & Edit.
    Running the game.
    Once you have the project open in Godot, follow these steps to run the game:

3. **Play the Game**:
    Press the F5 key or click the play button (a triangular icon) in the top right corner of the Godot editor.
    The game will start, and you can begin your adventure.

-Game Instructions

    *Movement*: Use the arrow keys or WASD to move your character.
    *Attack*: Use the spacebar to attack enemies.
    *Objective*: Clear each room of enemies to proceed to the next one. Defeat the final boss in the last room to win the game.


## Technical Details

### Collision Detection
    We used Godot's built-in collision detection systems to manage interactions between the player, enemies, and the environment. This ensures smooth and realistic movements and accurate recording of attacks and damage.


### Finite State Machines
    Each enemy uses a finite state machine (FSM) to manage different behaviors, such as patrolling, chasing the player, and attacking. This makes enemies more intelligent and unpredictable, enhancing the overall gameplay experience.