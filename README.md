# Vacation Calculation System

## Overview
This application is designed to manage and calculate employee vacation days according to Chilean labor laws. It support various vacations types, such as normal vacation, progressive vacation, and proportional vacation, ensuring accurate and transparent vacation policies for employees.

## Implemented Features

1. **Vacation Calculation**
   The application calculates vacation days based on three types of leave in compliance with Chilean labor laws:

   - **Normal Vacation:** Employees are entitled to 15 working days of vacation after completing 1 year of employment in the same company.
   - **Progressive Vacation:** Employees are granted 1 additional vacation day for every 2 years worked at the same company after accumulating 10 years of work. If the employee changes jobs, the progressive vacation days are reset.
   - **Proportional Vacation:** Employees who have worked less than 1 year at the company are granted proportional vacation days, calculated as **1.25 days per month worked**.

2. **Input Data Handling**
   The application **does not store employee data**. Instead, it dynamically calculates vacation days based on the following inputs:

   - `start_date`: The date employee started working at the company.
   - `total_worked_years`: The number of years the employee has worked.
   - `last_three_years_same_company`: A boolean value indicating whether the employee has continuosly worked the last 3 years at the same company.
   - `query_date`: The reference date for the calculation.

   These inputs are processed in real time to determine the employee's entitlement to vacation days.

3. **Vacation Logic**
   The application uses the provided input values to calculate the appropriate vacation entitlement, considering:
   - The employee's total work history.
   - The tenure with the current employer.
   - The specific `query_date` to calculate the exact duration of the employment and prorate vacation days accurately.
   - Assumptions based on calendar days (30 days per month) and the inclusion of weekends/holidays.

   The logic is designed to ensure fair and accurate results in compliance with regulations.

4. **Test Cases**
   The system has been validated using various employee scenarios to ensure accuracy:
   - Employees with **more than 1 year of employment** correctly receive 15 days of vacation.
   - Progressive vacation days are calculated properly, granting  **1 additional day for every 3 years worked at the same company** after reaching 10 year threshold.
   - Employees with **less than 1 year of service** are awarded proportional vacation days based on the number of the months worked (1.25/month)
   - Scenarios where `query_date` affects the calculation, such as partial months or anniversaries, are handled correctly.

## Environment Specifications

- **Ruby Version:** `3.1.1`
- **Rails Version:** `7.0.3`

## How to Run the Application

### Prerequisites
Make sure you have the following installed:
1. Ruby `3.1.1`
2. Bundler (`gem install bundler`)

### Steps to Run
1. **Clone the repository:**
   ```
   https://github.com/CristianConcha/Technical_Test_Buk.git
   cd Technical_Test_Buk
   ```
2. **Install dependencies:**
   ```
   bundle install
   ```
3. **Run server:**
   ```
   rails server
   ```
4. **Access the application:**
   Open your browser and go to http://localhost:3000

## How to Run the Test
1. **Clone the repository:**
   ```
   https://github.com/CristianConcha/Technical_Test_Buk.git
   cd Technical_Test_Buk
   ```
2. **Install dependencies:**
   ```
   bundle install
   ```
3. **Run tests:**:
   ```bash
   rails test
   ```
4. **Check test results:**
   Once the tests have finished running, the results will be displayed in the terminal.
5. **Running specific tests**
   ```
   rails test test/models/file_name.rb
   ```
   Replace the file_name.rb with the path to the specific test file you want to run.

## Project Structure
   ```bash
   Technical_Test_Buk/
   ├── .github/
   │   ├── workflows
   │   │   └── test.yml
   ├── app/
   │   ├── controllers/
   │   │   └── vacations_controller.rb
   │   ├── models/
   │   │   └── employee.rb 
   │   ├── services/
   │   │   └── vacations_calculator.rb
   │   ├── views/
   │   │   └── vacations/
   │   │       ├── new.html.erb
   │   │       └── _vacation_days_result.html.erb
   ├── config/
   │   └── routes.rb
   ├── test/
   │   ├── models/
   │   │   └── employee_test.rb
   └── README.md
   ```

### Folder Description
1. **.github/workflows**
   - `run_tests.yml`: This file contains the configuration for GitHub Actions, set up to automatically run the project tests every time there is a push or pull request to the main branch.
2. **app/controllers**
   - `vacations_controller`: Manages the logic for handling requests related to vacation calculations. It receives input from users, processes the data and return the appropriate results.
3. **app/models**
   - `employee.rb`: Defines the emplyee data model, including essential fields for vacation calculations, such as the start date at the company, total years worked and tenuere at the current employer. This model constains methods to calculate different types of vacations: nomal, progresive and roportional.
4. **app/services**
   - `vacations_calculator.rb`: Implements the core logic for vacation calculations, considering the normal, progressive and proportional vacations types. This service receives the employee data and the query date, validates the information and uses the methonds from the employee model to calculate the total vacation days.
5. **app/views/vacations**
   - `new.html.erb`: Displays the form for user input, where employees data susch as start date, total worked years, last three years in the same company and query date.
   - `_vacation_days_result.html.erb`: A partial view used to display the result of the vacation day calculation after submission.
6. **config**
   - `routes.rb`: Manages routing for the application, defining how http requests are mapped to the appropriate controller actions.
7. **test/models**
   - `employee_test.rb`: Contains tests to ensure the proper fucntionality of the employee model checking data integrity and correctness before calculations.

