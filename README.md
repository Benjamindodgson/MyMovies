# My Movies App

Welcome to the **My Movies App**! This project is part of a technical interview and serves as an opportunity to showcase your development skills using **SwiftUI** and **structured concurrency**. The application allows users to search for movies.

## Getting Started

To contribute to this project, follow these steps:
1. **Clone the Repository**: Pull the repository to your local machine.
   ```sh
   git clone https://github.com/Benjamindodgson/MyMovies.git
   ```
2. **Create a New Branch**: Create a new branch for your changes.
   ```sh
   git checkout -b feature/your-feature-name
   ```
3. **Make Your Changes**: Develop the features based on the project requirements.
4. **Push and Create a Pull Request (PR)**: Push your branch to the repository and create a pull request for review.
   ```sh
   git push origin feature/your-feature-name
   ```
   Then, go to GitHub and create a pull request for your branch.
5. **Simulator Video**: Record a simulator video demonstrating the functionality of the app and attach it to the final PR.

## Project Requirements

### Unit Tests:
- **Coverage**: Implement unit tests to ensure critical logic is covered.
- **Testing Framework**: Use **XCTest** to create unit tests for the business logic and API interactions.
- **Mocking**: Use mocking techniques to test network requests, avoiding actual API calls during testing.
- **Core Features**: Ensure that core functionalities, including movie search, API data handling, and any custom views, are thoroughly tested.


### Basic Features:
1. **Movie Search Screen**: 
   - Provide a search interface for users to search for movies by title.
   - Fetch movie data from the [The Movie Database (TMDb) API](https://www.themoviedb.org/documentation/api).
   - Display results using a list that includes movie posters and titles.
   - Make use of **SwiftUI** for the user interface and **structured concurrency** for managing network calls.

## API Access
This project uses the **The Movie Database (TMDb)** API to fetch movie data. You will need the following credentials to access the API:

- **API Key**: `002fa132a57542d5b8ef6b1e33b6b956`
- **API Read Access Token**: `eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwMDJmYTEzMmE1NzU0MmQ1YjhlZjZiMWUzM2I2Yjk1NiIsIm5iZiI6MTcyOTY5MjkxMy44NzQxMTEsInN1YiI6IjY3MTkwMzhkMjdiZDU3ZDkxZjYyMmM4MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.kxM7H0L3ZT9zIGPn3MUKO5mRqyCaaFHbyWh8yZBLm3s`

You can use the above **API Key** and **Read Access Token** to authenticate your requests.

## Expectations
- **Simulator Video**: Record a simulator video demonstrating the functionality of the app and attach it to the final PR.
- **Clean Code**: Write clean, readable code that follows best practices.
- **Decision Making**: Document your architectural decisions and why you chose certain approaches.
- **SwiftUI Expertise**: Leverage SwiftUI for a modern, declarative approach to UI design.
- **Concurrency**: Use async/await to manage API calls, ensuring a responsive user experience.

## Running the Project
To run this project, simply clone the repository, open the project in **Xcode**, and add the API credentials if they aren't already set. Ensure you are using **Xcode 13** or newer, as it is required for SwiftUI and structured concurrency support.

## Future Extensions
If the project proceeds to subsequent stages, you may be asked to:
- **Movie Detail Screen**: When a user selects a movie, navigate to a detail screen that shows more information about the movie, including its poster, title, release date, and description. Create a visually appealing UI using **SwiftUI** animations and transitions.
- **Favorite Movies**: Implement functionality to allow users to save their favorite movies. Use whatever local persistence you feel is appropriate.
- Implement a "Recommended Movies" section using more advanced state management and caching techniques.
- Handle edge cases such as offline mode, errors, and data persistence.

## Helpful Resources
- [The Movie Database API Documentation](https://www.themoviedb.org/documentation/api)

Good luck and enjoy building the My Movies App!






# Pull Request (PR) Checklist for My Movies App

Before submitting your Pull Request (PR), please go through the following checklist to ensure all project standards and requirements are met.

## Code Quality
- [ ] **Clean Code**: Ensure the code is clean, readable, and follows best practices.
- [ ] **Naming Conventions**: Use clear and descriptive names for variables, functions, and classes.
- [ ] **Comments**: Add necessary comments to explain non-obvious code logic.
- [ ] **Error Handling**: Handle errors gracefully, especially for network calls.

## SwiftUI Requirements
- [ ] **SwiftUI Usage**: Leverage SwiftUI for building the user interface.
- [ ] **Animations and Transitions**: Add smooth animations or transitions where applicable.

## Concurrency
- [ ] **Structured Concurrency**: Use `async/await` effectively for managing API calls.
- [ ] **Thread Safety**: Verify all async operations are handled appropriately to prevent race conditions or deadlocks.

## Testing
- [ ] **Unit Tests**: Ensure unit tests are provided for core business logic and API interactions.
- [ ] **Test Coverage**: Aim for at least 80% test coverage of critical code paths.
- [ ] **Mocking**: Mock network requests to avoid actual API calls during testing.

## Project Features
- [ ] **Movie Search Screen**: Ensure the search screen allows users to search movies by title and shows results in a list.
- [ ] **API Integration**: Confirm API integration is working properly, including fetching movie data and displaying the necessary information.

## Documentation
- [ ] **README Updated**: Update the README file if any project requirements have changed or if additional instructions are necessary.
- [ ] **Architectural Decisions**: Document any major architectural decisions or approaches you have taken.

## Branch and PR Management
- [ ] **Branch Naming**: Use an appropriate branch name following the naming convention (`feature/your-feature-name`).
- [ ] **Pull Request Title**: Give your PR a descriptive title that summarizes the changes.
- [ ] **Pull Request Description**: Provide a clear description of the changes made, why they were necessary, and any additional context.
- [ ] **Code Review**: Request a code review from relevant team members.

## Functionality Checks
- [ ] **Manual Testing**: Perform manual testing to ensure the app works as expected (including edge cases like empty search results, network failures, etc.).
- [ ] **Responsiveness**: Ensure that the UI is responsive across different device sizes.
- [ ] **Favorites Feature**: If applicable, check that users can save and view their favorite movies without issues.

## Future Considerations
- [ ] **Scalability**: Consider how the current code will be extended in future stages, such as adding more features (e.g., detailed movie views, user reviews, etc.).
- [ ] **Offline Handling**: Ensure the application can handle offline scenarios, and inform users appropriately.

## Final Steps
- [ ] **Conflict Resolution**: Make sure your branch has no merge conflicts with the `main` branch.
- [ ] **Pass CI/CD**: Ensure all checks in CI/CD pipeline are passing.

Once all items are checked, you're ready to submit the PR for review!

---

Please ensure all the above items are addressed before submitting. This will help speed up the review process and maintain the quality of our codebase. Thank you for your contribution!

