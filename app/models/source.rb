class Source < ApplicationRecord
  belongs_to :travel_authorization, optional: true
  #belongs_to :expense_report, optional: true
  belongs_to :expense

  validates_presence_of :department, :amount
  validates_numericality_of :department, :amount, :only_integer => true



end
