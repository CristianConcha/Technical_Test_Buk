
class Employee
  attr_accessor :start_date, :total_worked_years, :last_three_years_same_company

  def initialize(start_date:, total_worked_years:, last_three_years_same_company:)
    @start_date = start_date
    @total_worked_years = total_worked_years
    @last_three_years_same_company = last_three_years_same_company
  end

  