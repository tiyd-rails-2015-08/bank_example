json.extract! @branch, :id, :name, :city, :number_of_clients
json.clients @branch.clients do |c|
  json.extract! c, :id, :name, :branch_id
  json.accounts c.accounts, :id, :name, :client_id
end
