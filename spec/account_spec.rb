require 'account'

describe Account do
  subject(:account) { described_class.new }

  before do
    allow($stdout).to receive(:puts)
    allow(Time).to receive(:now).and_return(Time.parse('2012-01-10'), Time.parse('2012-01-13'), Time.parse('2012-01-14'))
  end

  it 'can deposit an amount with given date' do
    expect{ account.deposit(1000) }.to change{ account.balance }.by(1000)
  end

  it 'allows withdrawal of a given amount on a specific date' do
    expect{ account.withdraw(500) }.to change{ account.balance }.by(-500)
  end

  it 'returns the historical transactions' do
    account.deposit(1000)
    account.deposit(2000)
    account.withdraw(500)

    example_arr = [['10/01/2012', 1000,nil,1000], ['13/01/2012',2000,nil,3000],
                  ['14/01/2012',nil,500, 2500]]

    expect(account.statement).to match_array(example_arr)
  end
end
