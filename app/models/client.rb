class Client < ActiveRecord::Base
  belongs_to :branch
  has_many :accounts
end
