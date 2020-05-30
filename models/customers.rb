require_relative('../db/sql_runner.rb')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers 
    (
      name,
      funds
    )
    VALUES 
    (
      $1, $2
    ) 
    RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values)
    @id = customer[0]['id']
  end

  def Customer.all()
    sql = "SELECT * FROM customers;"
    results = SqlRunner.run(sql)
    customers = results.map { |customer| Customer.new(customer)}
    return customers
  end

  def Customer.delete_all()
    sql = "DELETE FROM customers;"
    SqlRunner.run(sql)
  end

  def update()
    sql = "
    UPDATE customers SET
    (
      name,
      funds
    ) =
    (
      $1, $2
    )
    WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def film()
    sql = "
    SELECT films.* 
    FROM films
    INNER JOIN tickets
    ON tickets.film_id = films.id
    WHERE customer_id = $1;"
    values = [@id]
    films = SqlRunner.run(sql, values)
    results = films.map { |film| Film.new(film) }
  end

  def ticket_count()
    sql = "
    SELECT * 
    FROM tickets
    WHERE customer_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.count
  end

  def funds()
    sql = "
    SELECT funds 
    FROM customers
    WHERE customers.id = $1"
    values = [@id]
    funds = SqlRunner.run(sql, values)[0]['funds'].to_i
  end

  def buy_ticket(film)
    film_price = film.price
    decreased_funds = @funds - film_price
    sql = "
    UPDATE customers
    SET
    
      funds
     = 
    
      $1
    
    WHERE id = $2"
    values = [decreased_funds, @id]
    SqlRunner.run(sql, values)
  end

end