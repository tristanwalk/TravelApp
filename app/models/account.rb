class Account < ApplicationRecord
	belongs_to :accountable, polymorphic:true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
ACCOUNT_TYPES=["SuperAccount", "Employee", "Payment Manager", "Budget Approver"]
	attr_accessor :type#, :firstName, :lastName, :empID, :deptNum
end
