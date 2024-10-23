# My Movies App

Welcome to the **My Movies App**! This project is part of a technical interview and serves as an opportunity to showcase your development skills using **SwiftUI** and **structured concurrency**. The application allows users to search for movies.

## Getting Started
To contribute to this project, follow these steps:
1. **Clone the Repository**: Pull the repository to your local machine.
   ```sh
   git clone <repository_url>
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
