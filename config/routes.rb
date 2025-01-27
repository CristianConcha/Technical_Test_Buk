Rails.application.routes.draw do
  root "vacations#new"
  post "/calculate_vacations", to: "vacations#calculate_vacations"
end
