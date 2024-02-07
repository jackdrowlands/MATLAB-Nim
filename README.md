# MATLAB-Nim

## Overview

MATLAB-Nim is a MATLAB implementation of the classic strategy game Nim. This project allows users to play Nim against a computer opponent in a graphical user interface (GUI). The game logic and GUI are built entirely with MATLAB, making it an excellent example of MATLAB's capabilities for educational and recreational purposes.

## Features

- **Interactive Gameplay:** Engage in the Nim game against a computer with a simple and intuitive MATLAB GUI.
- **Strategic AI:** The computer opponent uses the Nim sum strategy to make decisions, providing a challenging experience.
- **Visual Feedback:** The game state is visually represented using MATLAB's plotting capabilities, allowing for an immersive experience.

## Game Rules

Nim is a mathematical game of strategy where two players take turns removing objects from distinct heaps or piles. In this version, players can remove any number of matchsticks from a single row during their turn. The goal is to be the player who removes the last matchstick.

## Installation

1. **Prerequisites:** Ensure you have MATLAB installed on your computer.
2. **Download:** Clone this repository or download the ZIP file and extract it.
3. **Run:** Open MATLAB, navigate to the project's directory, and run the `main.m` script.

## How to Play

1. **Start the Game:** Run the `main.m` script. A GUI will appear showing rows of matchsticks.
2. **Make Your Move:** Click on the row number you wish to remove matchsticks from, then enter the number of matchsticks to remove.
3. **Computer's Turn:** After your move, the computer will automatically make its move.
4. **Winning the Game:** The player forced to take the last matchstick loses. Try to be the one to force the computer to take the last matchstick!

## Files and Functions

- `main.m`: Initializes the game and controls the gameplay loop.
- `clickedOn.m`: Handles user interactions with the GUI.
- `computerMove.m`: Determines the computer's strategy for removing matchsticks.
- `displayGame.m`: Updates the GUI to reflect the current state of the game.
- `nimSum.m`: Calculates the nim sum to guide the computer's strategy.
