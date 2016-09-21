class Account

  attr_reader :balance

  def initialize
    @transactions = []
    @balance = 0
  end

  def deposit(amount)
    update_balance(amount, true)
    @transactions.push [Time.now.strftime("%d/%m/%Y"), amount, nil, balance]
  end

  def withdraw(amount)
    update_balance(amount, false)
    @transactions.push [Time.now.strftime("%d/%m/%Y"), nil, amount, balance]
  end

  def statement
    puts "date || credit || debit || balance"
    @transactions.reverse_each do |transaction|
      puts "#{transaction[0]} || #{transaction[1]} || #{transaction[2]} || #{transaction[3]}"
    end
  end

  private

  def update_balance(amount, deposit)
    if deposit
      @balance += amount
    else
      @balance -= amount
    end
  end

end
