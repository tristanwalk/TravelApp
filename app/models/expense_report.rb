class ExpenseReport < ApplicationRecord
  belongs_to :employee, optional: true
  belongs_to :budget_approvers, optional: true
  belongs_to :payment_managers, optional: true

  has_many :expenses, dependent: :destroy
  has_many :receipts, through: :expenses
  has_many :sources, through: :expenses
  accepts_nested_attributes_for :sources, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :expenses, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :firstName, :lastName, :empID, :tripNum, :deptNum, :formNum, :departDate, :returnDate, :destination, :purpose
  validates_numericality_of :empID, :tripNum, :formNum, :deptNum, :only_integer => true
  validates_date :departDate, :returnDate, :on_or_after => lambda { Date.current }

  STATUS_TYPES=["Pending", "Denied", "Approved"]

  def get_total_expenses
  	expenses.to_a.sum { |expense| expense.get_total_expenses}
  end

end
