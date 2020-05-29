require('pry')
require_relative('models/customers.rb')
require_relative('models/films.rb')
require_relative('models/tickets.rb')

customer1 = Customer.new({'name' => 'Johnny', 'funds' => 100})

customer1.save()

binding.pry
nil