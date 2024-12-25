# PipelineDemo

## Overview
PipelineDemo is a demonstration project showcasing the implementation of a CI/CD pipeline using Jenkins. The project automates the process of building, testing, and deploying a simple Java application.

## Features
- **Automated Build**: Compiles the Java application using Maven.
- **Testing**: Runs unit tests to ensure code quality.
- **Deployment**: Deploys the application to a specified environment (e.g., staging or production).

## Technologies Used
- Jenkins
- Java
- Maven
- Git

## Getting Started

### Prerequisites
- Jenkins installed on your system ([Download Jenkins](https://www.jenkins.io/download/)).
- Plugins required:
  - Pipeline
  - Git
  - Maven Integration

### Setting Up the Pipeline
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/22127185-22127480/PipelineDemo.git
   ```

2. **Configure Jenkins**:
   - Create a new Jenkins job and select "Pipeline" as the project type.
   - In the Pipeline section, set the definition to "Pipeline script from SCM" and select Git.
   - Provide the repository URL: `https://github.com/22127185-22127480/PipelineDemo.git`.
   - Specify the branch to build (e.g., `main`).

3. **Run the Pipeline**:
   - Save the configuration and build the project.
   - The pipeline will execute the stages defined in the `Jenkinsfile`.

## Pipeline Stages
1. **Build**: Compiles the application using Maven.
2. **Test**: Executes unit tests to verify the application's functionality.
3. **Deploy**: Deploys the application to the specified environment.

## Contributing
Contributions are welcome! To contribute:
1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Submit a pull request with a detailed description of the changes.

## License
This project is licensed under the MIT License. See the `LICENSE` file for details.

---

For more information on setting up CI/CD pipelines using Jenkins, visit the [official documentation](https://www.jenkins.io/doc/).

