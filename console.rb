require('pry')
require_relative('models/customer.rb')
require_relative('models/film.rb')
require_relative('models/ticket.rb')

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()

customer1 = Customer.new({'name' => 'Johnny', 'funds' => 100})
customer2 = Customer.new({'name' => 'Adam', 'funds' => 200})
customer3 = Customer.new({'name' => 'Tony', 'funds' => 300})
customer1.save()
customer2.save()
customer3.save()

film1 = Film.new( {'title' => "Hacksaw Ridge", 'price' => 20 })
film2 = Film.new( {'title' => "Lord of the rings", 'price' => 10 })
film3 = Film.new( {'title' => "Django", 'price' => 5 })
film1.save()
film2.save()
film3.save()

ticket1 = Ticket.new( {'customer_id' => 1, 'film_id' => 1})
ticket2 = Ticket.new( {'customer_id' => 1, 'film_id' => 2})
ticket3 = Ticket.new( {'customer_id' => 2, 'film_id' => 1})
ticket4 = Ticket.new( {'customer_id' => 3, 'film_id' => 3})
ticket5 = Ticket.new( {'customer_id' => 3, 'film_id' => 1})
ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()
ticket5.save()


binding.pry
nil