class Branch < ActiveRecord::Base
  has_many :clients
  has_many :accounts, through: :clients

  def number_of_clients
    self.clients.count
  end
end
