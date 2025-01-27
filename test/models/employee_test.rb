require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase

  # Test for the method normal vacations
  test "employee with more than 1 year of work at the same company should have 15 days of vacation" do
    employee = Employee.new(
      start_date: Date.new(2023, 1, 1),
      total_worked_years: 1,
      last_three_years_same_company: false
    )
    query_date = Date.new(2024, 1, 1)

    assert_equal 15, employee.normal_vacations(query_date)
  end

  # Test for the method progressive vacations
  test "employee with 13 years of work and last 3 years at the same company should have 16 days of vacation" do
    employee = Employee.new(
      start_date: Date.new(2013, 1, 1),
      total_worked_years: 13,
      last_three_years_same_company: true
    )
    query_date = Date.new(2023, 1, 1)

    assert_equal 16, employee.progressive_vacations(query_date)
  end

  test "employee with 16 years of work and last 6 years at the same company should have 17 days of vacation" do
    employee = Employee.new(
      start_date: Date.new(2007, 1, 1),
      total_worked_years: 16,
      last_three_years_same_company: true
    )
    query_date = Date.new(2023, 1, 1)

    assert_equal 17, employee.progressive_vacations(query_date)
  end

  test "employee with 19 years of work and last 9 years at the same company should have 18 days of vacation" do
    employee = Employee.new(
      start_date: Date.new(2007, 1, 1),
      total_worked_years: 19,
      last_three_years_same_company: true
    )
    query_date = Date.new(2023, 1, 1)

    assert_equal 18, employee.progressive_vacations(query_date)
  end

  # Test for the method proportional vacations
  test "employee with 8 months and 24 days of work should have 11 days of vacation" do
    employee = Employee.new(
      start_date: Date.new(2023, 1, 1),
      total_worked_years: 0,
      last_three_years_same_company: false
    )
    query_date = Date.new(2023, 9, 25)
    assert_equal 11, employee.proportional_vacations(query_date)
  end

  test "employee with 3 months and 0 days of work should have 3.75 days of vacation" do
    employee = Employee.new(
      start_date: Date.new(2023, 1, 1),
      total_worked_years: 0,
      last_three_years_same_company: false
    )
    query_date = Date.new(2023, 4, 1)
    assert_equal 3.75, employee.proportional_vacations(query_date)
  end

  test "employee with 1 month and 0 days of work should have 1.25 days of vacation" do
    employee = Employee.new(
      start_date: Date.new(2023, 1, 1),
      total_worked_years: 0,
      last_three_years_same_company: false
    )
    query_date = Date.new(2023, 2, 1)
    assert_equal 1.25, employee.proportional_vacations(query_date)
  end
end