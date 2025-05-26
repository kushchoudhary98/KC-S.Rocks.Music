# S Rocks Music

## ScreenRecordings



https://github.com/user-attachments/assets/2ee5c228-3c48-42bb-8c4a-46d6b8d42abd



https://github.com/user-attachments/assets/03094b11-843a-496d-b213-8231bf78b0e9




### Architecture & State Management

This Flutter project follows a clean MVVM (Model-View-ViewModel) architecture, promoting scalability, maintainability, and separation of concerns.

---

### Key Approaches Used

#### MVVM Pattern

- **Model**  
  Defines plain data classes (e.g., `ServiceModel`) that represent structured data from Firestore or external APIs.

- **ViewModel**  
  Manages business logic and app state. Example: `HomeViewModel` extends `ChangeNotifier`, fetches data via services like `HomeService`, and notifies the UI when state changes.

- **View**  
  Composed of Flutter widgets that consume `ViewModel` instances using the `Provider` package. Views remain declarative and UI-focused, with no business logic.

---

#### Provider for State Management

- Uses `ChangeNotifierProvider` from the `provider` package to inject view models into the widget tree.
- Automatically rebuilds widgets on state updates, encouraging a reactive and modular architecture.
- Promotes a clear separation between logic and presentation.

---

#### Dependency Injection (DI) with get_it

- A `service_locator.dart` file is used to register and resolve dependencies via the `get_it` package.
- This approach decouples service implementations from UI/view model layers, improving testability and flexibility.


## Folder Structure

<pre>
lib/
│
├── di/                            # Dependency Injection setup with get_it
│   └── service_locator.dart
│
├── models/                        # Plain data models
│   └── service.dart
│
├── services/                      # Business logic / external sources (Firestore, APIs, etc.)
│   └── home_service.dart
│
├── utils/                         # App-wide core utilities
│   ├── routes/                    # App routing logic
│   └── constants.dart             # Static values, colors, strings
│
├── viewmodels/                    # State management (ChangeNotifier logic)
│   └── home_view_model.dart
│
├── views/                         # UI Screens (Widgets as Views)
│   ├── home/                      # Main home section screens
│   │   ├── home.dart
│   │   ├── main_screen.dart
│   │   ├── news.dart
│   │   ├── projects.dart
│   │   └── track_box.dart
│   │
│   └── services/                  # Individual service detail pages
│       ├── lyrics_writing.dart
│       ├── mixing_mastering.dart
│       ├── music_production.dart
│       └── vocals.dart
|
├── widgets/                       # Reusable UI components
│   └── custom_nav_bar.dart
│
├── firebase_options.dart          # Firebase configuration file (auto-generated)
│
└── main.dart                      # Entry point of the app
</pre>

