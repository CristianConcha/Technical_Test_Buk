
class Employee
  attr_accessor :start_date, :total_worked_years, :last_three_years_same_company

  def initialize(start_date:, total_worked_years:, last_three_years_same_company:)
    @start_date = start_date
    @total_worked_years = total_worked_years
    @last_three_years_same_company = last_three_years_same_company
  end

  # Methods
  def normal_vacations(query_date)

    total_months = (query_date.year * 12 + query_date.month) - (@start_date.year * 12 + @start_date.month)

    total_vacations = (total_months >= 12 && @total_worked_years >= 1) ? 15 : 0
  end

end