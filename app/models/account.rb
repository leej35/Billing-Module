class Account < ActiveRecord::Base
  belongs_to :patient
  has_and_belongs_to_many :medical_schemes
  has_many :items
end


