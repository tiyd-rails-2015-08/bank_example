class Expense < ActiveRecord::Base
  belongs_to :account

  def self.search_results(search_term)
    q = "%#{search_term}%"
    Expense.joins(account: {client: :branch}).
        where("payee LIKE ? OR accounts.name LIKE ? OR clients.name LIKE ? OR branches.name LIKE ?", q, q, q, q)
  end

  def account_name
    account.name
  end
end
