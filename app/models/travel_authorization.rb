class TravelAuthorization < ApplicationRecord

  belongs_to :employee, optional: true
  belongs_to :budget_approver, optional: true
  belongs_to :payment_manager, optional: true
  has_many :expenses, dependent: :destroy
  #has_many :sources, dependent: :destroy
  has_many :sources, through: :expenses
  accepts_nested_attributes_for :sources, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :expenses, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :firstName, :lastName, :empID, :tripNum, :deptNum, :formNum, :departDate, :returnDate, :destination, :purpose
  validates_numericality_of :empID, :tripNum, :formNum, :deptNum, :only_integer => true
  validates_date :departDate, :returnDate, :on_or_after => lambda { Date.current }


  STATUS_TYPES=["Pending", "Denied", "Approved"]
	attr_accessor :statusBA

end
