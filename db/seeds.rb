# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

beginning = Time.now

100.times do
  Branch.create!(name: Faker::Company.name,
      city: Faker::Address.city)
end

branches = Branch.all
1000.times do
  Client.create!(branch_id: branches.sample.id,
      name: Faker::Name.name,
      hometown: Faker::Address.city)
end

clients = Client.all
account_types = ["Checking", "Savings", "UTMA", "Money Market", "401K", "Hole in the back yard"]
10000.times do
  Account.create!(client_id: clients.sample.id,
      name: Faker::Commerce.department,
      account_type: account_types.sample)
end

accounts = Account.all
100000.times do
  Expense.create!(account_id: accounts.sample.id,
      spent_on: Date.today - rand(1000).days,
      payee: Faker::Name.name)
end

puts "Total time: #{Time.now - beginning} seconds."
