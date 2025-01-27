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
end