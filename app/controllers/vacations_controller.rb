
class VacationsController < ApplicationController
  before_action :build_employee, only: :calculate_vacations

  def new
  end

  def calculate_vacations
    @query_date = Date.parse(params[:query_date])

    # Calculate Vacations
    begin
      vacation_calculation_service = VacationsCalculator.new(employee: @employee, query_date: @query_date)
      result = vacation_calculation_service.calculate_vacations
      @vacations_days = result[:vacations_days]
      @vacation_type = result[:vacation_type]
    rescue => e
      flash[:alert] = "Error calculando vacaciones: #{e.message}"
    end

    render partial: 'vacations_days_result'
  end

  private 

  def build_employee
    @employee = Employee.new(
      start_date: Date.parse(params[:start_date]),
      total_worked_years: params[:total_worked_years].to_i,
      last_three_years_same_company: params[:last_three_years_same_company] == "true"
    )
  end

end