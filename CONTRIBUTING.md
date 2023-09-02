Thank you for contributing to enhance. Feel free to fork this repository and raise a pull request.

## Contributing to Enhanced Stat :handshake:

We warmly welcome contributions to the Enhanced Stat project! To maintain code quality and consistency, we follow the GitFlow branching model. Below is a quick guide on how to contribute using GitFlow.

---

### GitFlow Overview :book:

The GitFlow workflow employs two parallel long-running branches to record the history of the project, `main` and `develop`:

- **Main**: This branch reflects the latest stable release of the project.
- **Develop**: This is the main branch where the source code of `HEAD` reflects a state with the latest delivered development changes for the next release.

Feature branches, release branches, or hotfix branches will typically branch off from `develop`.

---

### Getting Started :rocket:

1. **Fork the Repository**: Start by forking the Enhanced Stat GitHub repository to your own GitHub account.

2. **Clone the Repository**: Clone your fork locally on your machine.

    ```bash
    git clone https://github.com/[YourUsername]/enhanced_stat.git
    ```

3. **Set Upstream**: Add the original repository as an upstream remote.

    ```bash
    git remote add upstream https://github.com/original-repo/enhanced_stat.git
    ```

4. **Create a Feature Branch**: Any new feature or bugfix should be developed in a separate branch.

    ```bash
    git checkout -b feature/your-feature-name develop
    ```

5. **Commit Your Changes**: Make your changes and commit them.

    ```bash
    git add .
    git commit -m "Implemented feature X"
    ```

6. **Push and Create a Pull Request**: Push your changes to your fork and create a pull request from there to the original repository.

    ```bash
    git push origin feature/your-feature-name
    ```

### Code Review :mag:

After you've made a pull request, maintainers and contributors will review your code. You may need to make some adjustments before your code is merged into the `develop` branch.

---

By adhering to the GitFlow branching model, we ensure a clean and understandable history, make the development process more efficient, and facilitate contributions from multiple developers. Thank you for considering contributing to Enhanced Stat! :heart: