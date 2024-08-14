# Project Resurrection: From Static Image to Interactive Masterpiece

Welcome to the quirky chronicle of Project Resurrection! What began as a static image without a color guide, font files, iconography, or dimension specifications transformed into an interactive digital delight. Here's how I navigated this creative conundrum.

## Initial Challenges and How I Overcame Them

### Color Conundrum

Faced with a colorful image but no color guide, I resorted to the almighty Windows Eyedropper Tool to extract hues directly from the image. To give them proper names, I used NameThatColor, creating a palette that brought the project to life.

### Font Fiasco

Assuming the font came from Bento's website was my first mistake. After analyzing every letter with the precision of a hawk, it was the quirky "K" that tipped me off – it wasn't the one. With the revelation that the PDF's font was the holy grail, I used a PDF font extractor and voilà, Nunito emerged victorious!

### Dimension Dilemmas

Though my "eyeballometer" is sharp, my engineering brain craves perfect dimensions. The image portrayed a phone screen, specifically an iPhone 11 Pro. Using its dimensions, I crafted a canvas in Photoshop. Simultaneously, I conjured a matching device in my emulator, aligning sizes and spacings to achieve near-perfection. Behavior-wise, experience guided my understanding of widget behavior. Not too shabby for eyeballing, right?

### Icon and Image Investigation

Google Lens became my partner in crime for icon and image retrieval. Uploading the desired icons and images, it pointed me towards the packs and sources I sought.

### Animation Antics

If I didn't have the dimensions, imagine the chaos of figuring out animations! It was like being thrown into a dance-off without knowing the moves. With divine intervention (and a lot of head-scratching), I summoned all my creativity to bring the project to life. I became a wizard of transitions, casting spells of fade-ins and slide-outs, hoping they'd look as cool as I imagined. Who knows what the original animations were supposed to be? With a sprinkle of magic and a splash of improvisation, I crafted animations that felt as smooth as a cat in slippers, adding that final touch of whimsy to the project.

Revel in the transformation!

---

Let's talk about something serious now.

## Video Presentation

You'll find a video presentation where I walk through the app and highlight its key features by accessing this link: [https://youtu.be/0fkFzIt1aQo](https://youtu.be/0fkFzIt1aQo).

[![Watch the video](https://img.youtube.com/vi/0fkFzIt1aQo/0.jpg)](https://youtu.be/0fkFzIt1aQo)

## Project Structure and Technologies

This project is a mobile application developed in Flutter, using Clean Architecture with Domain-Driven Design (DDD) to provide a robust and scalable code structure.

### Technologies Used

- **Flutter 3.22**: Used to develop the cross-platform user interface, allowing the creation of high-performance and aesthetically pleasing applications for Android and iOS from a single codebase.

### Project Structure

The project follows the principles of clean architecture with DDD, dividing business logic into distinct layers to promote scalability and ease of maintenance. The main layers include:

- **Domain**: Contains entities, use cases, and interfaces, defining the core behavior and logic of the application.
- **Data**: Implements repositories and data sources, connecting to APIs or databases to retrieve and persist data.
- **Presentation**: Includes UI widgets and manages user interaction.

### State Management

For managing views, `ValueNotifier` is used, a native Flutter solution that allows efficient and reactive state updates. Within widgets, especially animated ones, Flutter's native `setState` is used to ensure greater performance control.

### Testing

To ensure the reliability and correctness of the application, I implemented unit tests for the `MockedClient`, gateways, and repositories. These tests validate the application's core functionalities and ensure that all components interact as expected.

To run the tests, simply execute the following command:

```bash
flutter test
```

## Packages Used

### [flutter_modular](https://pub.dev/packages/flutter_modular) 6.3.4

Facilitates navigation and dependency injection, promoting a modular architecture where each module has its routes and injections.

**Key Features:**

- Modular project organization.
- Route management.
- Dependency injection.

### [dartz](https://pub.dev/packages/dartz) 0.10.1

Brings functional programming concepts to Dart, such as optional types and immutable collections, helping to avoid runtime errors.

**Key Features:**

- Functional data types like `Either` and `Option`.
- Promotes safety and clarity in error handling.
- Immutable operations.

### [lottie](https://pub.dev/packages/lottie) 3.1.2

Renders animations exported from Adobe After Effects as JSON files, allowing for the creation of dynamic and engaging interfaces.

**Key Features:**

- Support for complex animations.
- Easy integration with Flutter interfaces.
- High-performance animations.

### [carousel_slider](https://pub.dev/packages/carousel_slider) 5.0.0

Allows for easy creation of image sliders/carousels, ideal for highlighting content visually.

**Key Features:**

- Responsive carousel creation.
- Support for multiple customization options.
- Easy to integrate and use.

### [convex_bottom_bar](https://pub.dev/packages/convex_bottom_bar) 3.2.0

Although not included directly in the dependencies, the `convex_bottom_bar` package was used by downloading and modifying its code to adapt the navigation bar to fit the specific needs of the project.

**Customization Details:**

- Enhanced navigation bar functionality.
- Tailored UI adjustments for project requirements.

### [shimmer](https://pub.dev/packages/shimmer) 3.0.0

Creates shimmering effects to indicate loading content, enhancing the user experience during data retrieval.

**Key Features:**

- Easy to implement loading animations.
- Enhances user feedback during loading states.

### [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) 0.13.1

Automates the generation of application launcher icons for Android and iOS, ensuring consistency across different devices and screen sizes.

**Key Features:**

- Simplifies the creation of launcher icons.
- Supports adaptive icons for Android.

### [mocktail](https://pub.dev/packages/mocktail) 1.0.4

A Dart package that simplifies mocking in unit tests. It allows for flexible and easy creation of mock objects for testing purposes.

**Key Features:**

- Easy to use API for creating mocks.
- Supports a variety of test scenarios.
- Ensures high test coverage by making mocks simpler to create.

### [equatable](https://pub.dev/packages/equatable) 2.0.5

A Dart package that helps implement equality comparisons quickly and correctly. It eliminates boilerplate code by using a mixin to implement value equality.

**Key Features:**

- Simplifies value equality checks.
- Reduces boilerplate code.
- Ensures correct equality implementation across Dart objects.

## Fun Facts

#### Minimalist by Nature

I am a man of few libraries. I prefer crafting my own custom widgets with configurations that suit my style. I love animations and enjoy creating dynamic, engaging interfaces with them. By building my components, I have full control over their behavior and appearance.

#### Realistic App Simulation

In this project, I aimed to reproduce a real-world app experience by calling the backend with external data. Even though this is a two-screen design challenge, I wanted to demonstrate my deep understanding of separation of concerns and architectural complexity. This approach highlights my ability to design scalable and maintainable software systems.

#### Detail-Oriented Design

I pay attention to the smallest details. If you explore the code, you'll notice the meticulous care I put into creating each entity and coupling each widget with its respective entity. Every aspect of the design is carefully thought out to ensure consistency and precision.

#### State Management Philosophy

I believe in simplicity when it comes to state management. I always rely on native solutions and love to measure performance metrics. Using `setState` correctly significantly improves application performance. State management is reserved solely for Views (and even then, only with `ValueNotifier`). Every state management library is essentially an abstraction of `setState` and `ValueNotifier`.

#### Commenting Approach

I usually don't add comments to my code because I believe that code should be simple and easily understandable. Exceptions are made for introducing new concepts to team members or marking deprecated elements. Otherwise, my variables and methods have descriptive, well-thought-out names, almost like telling a story.

---

These insights offer a glimpse into my development philosophy and highlight my commitment to creating high-quality software with a focus on simplicity, efficiency, and customization.

## Installation

To set up the project, follow the steps below:

1. Ensure Flutter 3.22 is installed. [Flutter installation guide](https://flutter.dev/docs/get-started/install).
2. Clone this repository:

   ```bash
   git clone https://github.com/FelippeNO/bento_challenge.git
   ```

3. Install dependencies:

   ```bash
   cd bento_challenge
   flutter pub get
   ```

4. Run the application:

   ```bash
   flutter run
   ```

5. Run the tests:

   ```bash
   flutter test
   ```
