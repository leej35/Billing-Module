class Payment < ActiveRecord::Base
  has_many :items
  belongs_to :account
end
