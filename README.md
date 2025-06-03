QML Remote Control UI
A graphical remote control interface built with QML and Qt Quick. The application showcases modular 
component design, centralized styling, and interactive controls for a simulated TV interface.

---

Features
- Fully implemented using QML and Qt Quick
- Modular, reusable components for layout and controls
- Centralized theme color (themeColor) used throughout
- Dynamic display of channel number and name
- Volume and channel control buttons
- Toggle buttons for features such as:
   -Closed Captions
   -HDR
   -Cast Connection
   -Mute
- Directional pad (D-pad) with center microphone button
- Visual feedback with color changes and animations

---

Components
- BorderGradient: Rectangle with a vertical gradient fill
- DoubleBorderGradient: Adds an inner gradient layer for depth
- Button and CircleButton: Stylized buttons with event handling
- tvControl: Central object managing state such as:
   - Current channel
   - Volume level
   - Active feature toggles

---
  
Interaction
- Input handling via TapHandler and MouseArea
- State changes reflected visually (e.g., button highlight, animated mic)
- Simulated screen updates based on tvControl state

---

Architecture
- Root: Window containing the full remote layout
- Each UI element built as a self-contained QML component
- Theme and layout scale consistently based on root themeColor

---

Requirements
Qt 6.x or later with QML and Qt Quick modules

---

Usage
To run the application:
1. Open the project in Qt Creator.
2. Run the QML scene from the main Window.qml file.
3. Interact with the remote UI to test functionality.

Beste Regards
Lifter Sam
