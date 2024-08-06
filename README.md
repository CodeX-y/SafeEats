# SafeEats
SafeEats is an app that helps users determine if a food product meets their dietary preferences, including vegan, vegetarian, halal, and kosher standards.

## Setup and Installation

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/CodeX-y/safe-eats.git
   cd safe-eats
   ```
3. **Install Dependencies:**
    ```bash
    bundle install
    npm install
    ```
4. **Set Up the Database:**
    ```bash
    rails db:create
    rails db:migrate
    rails db:seed
    ```
6. **Run the Application:**
    ```bash
   bin/dev
    ```
8. **Access the Application:**
   Open your browser and navigate to `http://localhost:3000`.


## Configuration
There are currently no configurations needed.

## Contribution

We welcome contributions to the SafeEats project! To ensure a smooth contribution process, please follow these guidelines:

### Coding Conventions
- Follow the [Ruby style guide](https://rubystyle.guide/) and adhere to [RuboCop rules](https://rubocop.org/).
- Write clear and descriptive commit messages.
- Ensure your code is well-documented and includes tests where applicable.

### Branch Naming Conventions
- Use the format `feature/your-feature`, `bugfix/your-bugfix`, or `hotfix/your-hotfix`.
  - For example: `feature/user-authentication`, `bugfix/fix-login-error`.

### Pull Request Process
1. **Fork the Repository:**
   - Fork the repository on GitHub by clicking the "Fork" button at the top right of the page.

2. **Create a New Branch:**
   - Clone your forked repository and create a new branch for your changes:
     ```bash
     git clone https://github.com/your-username/safe-eats.git
     cd safe-eats
     git checkout -b feature/your-feature
     ```

3. **Make Changes and Commit:**
   - Make your changes and commit them with a descriptive message:
     ```bash
     git add .
     git commit -m "Add feature to handle user authentication"
     ```

4. **Push Changes:**
   - Push your branch to your forked repository:
     ```bash
     git push origin feature/your-feature
     ```

5. **Open a Pull Request:**
   - Navigate to the repository on GitHub and open a pull request from your branch to `main` or `develop`.
   - Provide a clear description of the changes in the pull request.

6. **Review and Merge:**
   - Review comments and address any feedback.
   - Once approved, your pull request will be merged into the main repository.

Thank you for contributing to SafeEats!

## ERD
<img width="584" alt="Screenshot 2024-08-02 at 5 30 57 PM" src="https://github.com/user-attachments/assets/a7a127fc-d498-49f3-badb-9a7b31225ac3">

## FAQ

### 1. How can I contribute to SafeEats?
Please refer to the [Contribution](#contribution) section for detailed guidelines on how to contribute, including coding conventions, branch naming, and the pull request process.

### 2. How do I report a bug or request a feature?
- **Report a Bug:** Open an issue on the [GitHub repository](https://github.com/CodeX-y/safe-eats/issues) with detailed information about the bug.
- **Request a Feature:** Open an issue on GitHub describing the feature you'd like to see.

### 3. How can I get help with issues?
For help with issues:
- Check the [Issues](https://github.com/CodeX-y/safe-eats/issues) section on GitHub for similar problems.
- If you don’t find a solution, open a new issue with details about your problem.

### 4. What technologies are used in SafeEats?
SafeEats uses Ruby on Rails for the backend and Bootstrap and CSS for frontend styling. It also incorporates libraries for user authentication and data processing.

### 5. How can I contact the maintainer?
You can reach the maintainer, CodeX-y, by opening an issue on the [GitHub repository](https://github.com/CodeX-y/safe-eats/issues).

### 6. Is SafeEats ready for production use?
SafeEats is primarily designed for development and testing. The goal is to develop the app for production use in the near future. Please review the code, perform comprehensive testing, and configure appropriate production settings so we can reach that goal.

If you have any additional questions, feel free to reach out or open an issue!

## Visual Aids

## API Documentation

The `SafeEats` application leverages the Open Food Facts API to check the dietary compliance of food products based on barcodes or ingredient names. Below is a guide to the API interactions and how `SafeEats` utilizes the Open Food Facts API.

### Base URL
The base URL for the Open Food Facts API endpoints is:
[](https://world.openfoodfacts.net/api/v0)

### Authentication
The Open Food Facts API requires an API key for authentication, which can be generated after signing up for an account on their website.


### Authentication
The Open Food Facts API requires an API key for public access. In this repo, the key is named OPEN_FOODS_API. An API key can be made by making an account of Open Food Facts and generating an API key.

### Endpoints

#### 1. Fetch Product by Barcode
- **Endpoint**: `/product/{barcode}.json`
- **Method**: `GET`
- **Description**: Retrieves detailed information about a product using its barcode.

**Request URL**:
[](https://world.openfoodfacts.net/api/v0/product/{barcode}.json)

**Response**:
```json
{
  "code": "3017620422003",
  "product": {
    "name": "Product Name",
    "ingredients_text": "Ingredients list...",
    "ingredients_analysis_tags": ["en:vegan"],
    "_keywords": ["vegan", "organic"],
    // other product details
  },
  "status": 1,
  "status_verbose": "product found"
}
```

#### 2. Fetch Product by Barcode
- **Endpoint**: `/product/{barcode}/ingredients_analysis.json`
- **Method**: `GET`
- **Description**: Retrieves ingredient analysis tags for a product.

**Request URL**:
[](https://world.openfoodfacts.net/api/v0/product/{barcode}/ingredients_analysis.json)

**Response**:
```json
{
  "ingredients_analysis_tags": ["en:vegan"]
}
```

#### Request/Response Formats
- **Requests**: All requests should be made using the HTTP GET method.
- **Responses**: Responses will be in JSON format containing product details, keywords, and ingredient analysis tags.
