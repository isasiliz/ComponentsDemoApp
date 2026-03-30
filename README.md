# ComponentsDemoApp

## Demo overview
`ComponentsDemoApp` is a demo app that shows the real usage of components from `SwiftUIComponentsKit`.

This app is not intended to be a production product; it is a lightweight showcase to explore component behavior and composition.

## Screens / Features
- Home
- Buttons
- TextFields
- SegmentedControl
- RadioButton
- About

## Structure
The **Home** feature is organized as:
- **Navigation**: `HomeCoordinator` and `HomeScreen` manage navigation state and destinations.
- **Presentations**: demo screens for each component (`ButtonPresentationView`, `TextFieldPresentationView`, `SegmentedControlPresentationView`, `RadioButtonPresentationView`).
- **SupportingViews**: reusable helper views used by Home.

## Purpose
This demo exists to:
- visualize states and variants of UI components,
- validate integration in a real SwiftUI app flow,
- serve as a practical usage reference for the package components.
