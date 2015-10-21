require 'csv'

class MakeCsvJob < ActiveJob::Base
  queue_as :cat_genocide

  def perform(search_term)
    expenses = Expense.search_results(search_term)

    CSV.open(File.join(Rails.root, "public", "search-#{Time.now}.csv"), "w") do |csv|
      csv << ["Payee", "Spent On"]
      expenses.each do |e|
        csv << [e.payee, e.spent_on]
      end
    end

  end
end
