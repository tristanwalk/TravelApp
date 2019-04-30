class Expense < ApplicationRecord
  belongs_to :travel_authorization, optional: true
  belongs_to :expense_report, optional: true
  has_many :receipts, dependent: :destroy
  has_many :sources, dependent: :destroy
  accepts_nested_attributes_for :receipts, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :sources, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :expenseName, :expectedAmount
  validates_numericality_of :expectedAmount, :actualAmount, :only_integer => true, :allow_nil => true
end
