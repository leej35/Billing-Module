class MedicalScheme < ActiveRecord::Base
  has_and_belongs_to_many :accounts
  has_many :rules
end
