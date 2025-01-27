
class VacationsCalculator
  def initialize(employee:, query_date:)
    @employee = employee
    @query_date = query_date
  end

  def calculate_vacations
    validate_employee
    calculate_vacation_days
  end

  private

  def validate_employee
    begin
      @employee.validate!(@query_date)
    rescue => e
      raise "Error validando empleado: #{e.message}"
    end
  end

  def calculate_vacation_days
    vacations_days = 0
    vacation_type = ""

    if @employee.last_three_years_same_company
      vacations_days = @employee.progressive_vacations(@query_date)
      vacation_type = "vacaciones progresivas"
    elsif @employee.total_worked_years >= 1
      vacations_days = @employee.normal_vacations(@query_date)
      vacation_type = "vacaciones normales"
    else
      vacations_days = @employee.proportional_vacations(@query_date)
      vacation_type = "vacaciones proporcionales"
    end

    { vacations_days: vacations_days, vacation_type: vacation_type }
  end

end