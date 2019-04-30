SuperAccount.transaction do
  SuperAccount.delete_all
  SuperAccount.create( :name => 'super' )
end

Account.transaction do
  Account.create!( :firstName => 'Admin', :lastName => 'Admin', :empID => 0, :deptNum => 0, :email => 'admin!@admin.com', :password => 'admin!', :password_confirmation => 'admin!', 
                  :accountable => SuperAccount.first())
end