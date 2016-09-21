class Account

  attr_reader :balance

  def initialize
    @transactions = []
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
    @transactions.push [Time.now.strftime("%d/%m/%Y"), amount, nil, balance]
  end

  def withdraw(amount)
    @balance -= amount
    @transactions.push [Time.now.strftime("%d/%m/%Y"), nil, amount, balance]
  end

  def statement
    puts "date || credit || debit || balance"
    @transactions.reverse_each do |transaction|
      puts "#{transaction[0]} || #{transaction[1]} || #{transaction[2]} || #{transaction[3]}"
    end
  end

end
