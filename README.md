# Shipa 🚀
## Real-Time Package Tracking App

### Overview
Shipa is a high-performance Flutter mobile application designed for real-time package tracking. Built with **Clean Architecture** and **Riverpod**, it provides a seamless user experience for monitoring courier movements with smooth, 60fps map animations and live data updates.

### Key Features
 - **Smooth Real-Time Tracking**: Experience fluid, seamless courier movement on the map using custom coordinate interpolation (60fps).
 - **No API Key Required**: Integrated with **OpenStreetMap (flutter_map)**, allowing for a fully functional map experience without the need for a Google Maps API key.
 - **Live Delivery Updates**: Real-time updates for Estimated Time of Arrival (ETA), courier details, and delivery status.
 - **Clean Architecture**: Modular code structure following industry best practices (Domain, Data, and Presentation layers).
 - **Robust State Management**: Leveraging Riverpod for efficient, decoupled, and testable state handling.

### Tech Stack
- **Framework**: Flutter
- **State Management**: Riverpod (StreamProvider, FutureProvider)
- **Maps**: OpenStreetMap via `flutter_map`
- **Architecture**: Clean Architecture (Feature-first approach)
- **UI/UX**: Flutter ScreenUtil for responsive design, custom animations for map tracking.

### Project Structure
The project is organized using a feature-first approach:
- **Domain Layer**: Entities and Repository interfaces (Business Logic).
- **Data Layer**: Models, DataSources (Mock implementation for live tracking), and Repository implementations.
- **Presentation Layer**: Riverpod providers, UI Screens (Widgets), and custom Animation logic.

### Getting Started

#### Prerequisites 
   - Flutter SDK installed. 
   - A code editor (VSCode or Android Studio).

#### Setup Instructions
1. Clone the repository:
   ```bash
   git clone https://github.com/habyaad/shipa.git
   cd shipa
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

### Design Decisions & Optimizations
#### 💡 Design Decisions
  - **OpenStreetMap Integration**: Switched from Google Maps to `flutter_map` to provide a key-less development experience while maintaining high-quality tile rendering.
  - **Clean Architecture**: Adopted to ensure separation of concerns, making the app modular and easy to scale.
  - **Seamless Animation System**: Implemented a custom `LatLngTween` and `AnimationController` to solve the "stuttering" issue common in real-time GPS tracking.

#### ⚡ Optimizations
  - **Frame-Perfect Camera Follow**: Used `WidgetsBinding.instance.addPostFrameCallback` and safety checks to ensure the map camera follows the courier without crashing during initialization.
  - **Efficient Builds**: Minimal widget rebuilding by selectively listening to specific providers.

#### 🛠️ State Management
The app uses Riverpod for decoupled business logic and UI updates:
- **`rideRouteProvider`**: Handles the initial asynchronous loading of the delivery path.
- **`rideTrackingProvider`**: A `StreamProvider` that listens to live coordinate and status updates from the repository.

### Preview
<img width="320" height="714" alt="Screenshot 2026-05-08 at 7 51 30 AM" src="https://github.com/user-attachments/assets/81d3b6c0-ec02-4a02-8d32-84619035af8a" />

### Download
[Download Release APK](https://github.com/habyaad/shipa/releases/download/v1.0.1/app-arm64-v8a-release.apk)
