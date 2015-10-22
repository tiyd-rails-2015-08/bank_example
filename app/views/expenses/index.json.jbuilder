# json.name "Mason"
# json.awesomeness_level 10

# json.payee @first_expense.payee
# json.spent_on @first_expense.spent_on

# json.extract! @first_expense, :id, :payee, :spent_on, :account_name

# json.array! @expenses, :id, :payee, :spent_on, :account_name

json.array! @expenses do |e|
  json.id e.id
  json.payee e.payee
end
