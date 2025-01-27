
class Employee
  attr_accessor :start_date, :total_worked_years, :last_three_years_same_company

  def initialize(start_date:, total_worked_years:, last_three_years_same_company:)
    @start_date = start_date
    @total_worked_years = total_worked_years
    @last_three_years_same_company = last_three_years_same_company
  end

  # Methods
  def normal_vacations(query_date)
    total_months_same_company = total_months_same_company(query_date)

    total_vacations = (total_months_same_company >= 12 && @total_worked_years >= 1) ? 15 : 0
  end

  def progressive_vacations(query_date)
    if @last_three_years_same_company && @total_worked_years >= 10
      total_months_same_company = total_months_same_company(query_date)
      years_same_company = (total_months_same_company / 12).to_i
      extra_years = @total_worked_years - 10
      relevant_years_for_progressive = [years_same_company, extra_years].min
      additional_days = (relevant_years_for_progressive / 3).floor
      total_vacations = normal_vacations(query_date) + additional_days
    else
      total_vacations = 0
    end

    total_vacations
  end

  def proportional_vacations(query_date)
    return 0 if query_date <= @start_date || @total_worked_years >= 1

    # Months worked
    total_months_same_company = total_months_same_company(query_date)
    months_vacations = total_months_same_company * 1.25

    # Days worked in the current month
    total_days_same_company = (query_date.day - @start_date.day).to_i.abs
    days_vacations = ((total_days_same_company/30.0) * 1.25).round(2)

    total_vacations = months_vacations + days_vacations
  end

  private

  def total_months_same_company(query_date)
    (query_date.year * 12 + query_date.month) - (@start_date.year * 12 + @start_date.month)
  end

end