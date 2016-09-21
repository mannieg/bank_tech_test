class Account

  attr_reader :balance

  def initialize
    @transactions = []
    @balance = 0
  end

  def deposit(amount)
    update_balance(amount, true)
    add [Time.now.strftime("%d/%m/%Y"), amount, nil, balance]
  end

  def withdraw(amount)
    update_balance(amount, false)
    add [Time.now.strftime("%d/%m/%Y"), nil, amount, balance]
  end

  def statement
    puts "date || credit || debit || balance"
    transactions.reverse_each do |transaction|
      puts "#{transaction[0]} || #{transaction[1]} || #{transaction[2]} || #{transaction[3]}"
    end
  end

  private

  attr_reader :transactions

  def add(array)
    @transactions.push array
  end

  def update_balance(amount, deposit)
    if deposit
      @balance += amount
    else
      @balance -= amount
    end
  end

end
