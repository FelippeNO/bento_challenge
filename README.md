# Project Resurrection: Breathing Life into a Static Image

Welcome to the wacky world of Project Resurrection! This journey began with a single, colorless image. Imagine staring at a blank slate with no colors, no fonts, no dimensions, and no icons or images. Yet, here we are, ready to tell the tale of how chaos turned into creation.

## Initial Challenges and Their Humorous Solutions

### Color Conundrum

In a world devoid of colors, I resorted to the almighty Windows Eyedropper Tool to snatch hues from the void. Armed with the names bestowed upon these colors by the mystical site NameThatColor, I created a color file, giving life to the lifeless.

### Font Fiasco

Assuming the font came from Bento's website was my first mistake. After analyzing every letter with the precision of a hawk, it was the quirky "K" that tipped me off – it wasn't the one. With the revelation that the PDF's font was the holy grail, I used a PDF font extractor and voilà, Nunito emerged victorious!

### Dimension Dilemmas

Though my "eyeballometer" is sharp, my engineering brain craves perfect dimensions. The image portrayed a phone screen, specifically an iPhone 11 Pro. Using its dimensions, I crafted a canvas in Photoshop. Simultaneously, I conjured a matching device in my emulator, aligning sizes and spacings to achieve near-perfection. Behavior-wise, experience guided my understanding of widget behavior. Not too shabby for eyeballing, right?

### Icon and Image Investigation

Google Lens became my partner in crime for icon and image retrieval. Uploading the desired icons and images, it pointed me towards the packs and sources I sought.

## Conclusion

From deciphering colors to identifying fonts and dimensions, and finally capturing icons, Project Resurrection transformed a humble image into a thriving, dynamic application. Join me in celebrating the triumph of engineering curiosity and a touch of humor over seemingly insurmountable odds. Together, we bring life to pixels!

Enjoy the chaos and creativity!

---

Let's talk about something serious now.

## Project Structure and Technologies

This project is a mobile application developed in Flutter, using clean architecture with Domain-Driven Design (DDD) to provide a robust and scalable code structure.

### Technologies Used

- **Flutter 3.22**: Used to develop the cross-platform user interface, allowing the creation of high-performance and aesthetically pleasing applications for Android and iOS from a single codebase.

### Project Structure

The project follows the principles of clean architecture with DDD, dividing business logic into distinct layers to promote scalability and ease of maintenance. The main layers include:

- **Domain**: Contains entities, use cases, and interfaces, defining the core behavior and logic of the application.
- **Data**: Implements repositories and data sources, connecting to APIs or databases to retrieve and persist data.
- **Presentation**: Includes UI widgets and manages user interaction.

### State Management

For managing views, `ValueNotifier` is used, a native Flutter solution that allows efficient and reactive state updates. Within widgets, especially animated ones, Flutter's native `setState` is used to ensure greater performance control.

## Packages Used

### [flutter_modular](https://pub.dev/packages/flutter_modular) ^6.3.4

Facilitates navigation and dependency injection, promoting a modular architecture where each module has its routes and injections.

**Key Features:**

- Modular project organization.
- Route management.
- Dependency injection.

### [dartz](https://pub.dev/packages/dartz) ^0.10.1

Brings functional programming concepts to Dart, such as optional types and immutable collections, helping to avoid runtime errors.

**Key Features:**

- Functional data types like `Either` and `Option`.
- Promotes safety and clarity in error handling.
- Immutable operations.

### [lottie](https://pub.dev/packages/lottie) ^3.1.2

Renders animations exported from Adobe After Effects as JSON files, allowing for the creation of dynamic and engaging interfaces.

**Key Features:**

- Support for complex animations.
- Easy integration with Flutter interfaces.
- High-performance animations.

### [carousel_slider](https://pub.dev/packages/carousel_slider) ^5.0.0

Allows for easy creation of image sliders/carousels, ideal for highlighting content visually.

**Key Features:**

- Responsive carousel creation.
- Support for multiple customization options.
- Easy to integrate and use.

### [convex_bottom_bar](https://pub.dev/packages/convex_bottom_bar) ^3.2.0

Although not included directly in the dependencies, the `convex_bottom_bar` package was used by downloading and modifying its code to adapt the navigation bar to fit the specific needs of the project.

**Customization Details:**

- Enhanced navigation bar functionality.
- Tailored UI adjustments for project requirements.

## Fun Facts

#### Minimalist by Nature

I am a man of few libraries. I prefer crafting my own custom widgets with configurations that suit my style. I love animations and enjoy creating dynamic, engaging interfaces with them. By building my components, I have full control over their behavior and appearance.

#### Realistic App Simulation

In this project, I aimed to reproduce a real-world app experience by calling the backend with external data. Even though this is a two-screen design challenge, I wanted to demonstrate my deep understanding of separation of concerns and architectural complexity. This approach highlights my ability to design scalable and maintainable software systems.

#### Detail-Oriented Design

I pay attention to the smallest details. If you explore the code, you'll notice the meticulous care I put into creating each entity and coupling each widget with its respective entity. Every aspect of the design is carefully thought out to ensure consistency and precision.

#### State Management Philosophy

I believe in simplicity when it comes to state management. I always rely on native solutions and love to measure performance metrics. Using `setState` correctly significantly improves application performance. State management is reserved solely for Views (and even then, only with `ValueNotifier`). Every state management library is essentially an abstraction of `setState` and `ValueNotifier`.

---

These insights offer a glimpse into my development philosophy and highlight my commitment to creating high-quality software with a focus on simplicity, efficiency, and customization.

## Installation

To set up the project, follow the steps below:

1. Ensure Flutter 3.22 is installed. [Flutter installation guide](https://flutter.dev/docs/get-started/install).
2. Clone this repository:

   ```bash
   git clone https://github.com/your-username/your-repository.git
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Run the application:

   ```bash
   flutter run
   ```
