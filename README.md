## Student Information
- Name: Firman
- Major: Information Systems
- Semester: 6

---

# AntreMedika

AntreMedika is a mobile application prototype for patient reservation systems in primary healthcare facilities (Clinics/Community Health Centers). This application is designed to reduce patient overcrowding in waiting rooms by implementing mathematical calculations based on the **M/M/1 Queuing Theory** to provide dynamic and real-time estimated waiting times.

This project is developed as part of the Practical Application Development course assignment at Jakarta International University.

## Features

- **Queue Management System:** Implements M/M/1 Queuing Theory algorithms to calculate waiting times.
- **Dynamic Live Tracking:** Real-time queue updates and status monitoring for patients.
- **Modular Architecture:** Built with a strict MVVM (Model-View-ViewModel) pattern for clean separation of concerns.
- **Centralized Design System:** Uses custom themes and reusable UI components for a consistent, professional user experience.
- **Patient Dashboard:** Clean interface for selecting clinics and taking queue numbers.

## Tech Stack

- **Framework:** Flutter (Dart)
- **State Management:** Provider
- **Design/Typography:** Google Fonts, Material Design 3


## Support

For support, email [firmanchristianp@gmail.com]

## Project Structure

The codebase follows a modular and scalable architecture:

```text
antre_medika/
├── lib/
│   ├── core/           # Global configurations (constants, themes, utilities)
│   ├── models/         # Data blueprints and entities
│   ├── providers/      # State management and business logic (ViewModels)
│   ├── screens/        # UI presentation layer (separated by feature)
│   ├── services/       # Network and database communication
│   ├── widgets/        # Reusable UI components (buttons, cards)
│   └── main.dart       # Application entry point
├── pubspec.yaml
└── README.md
