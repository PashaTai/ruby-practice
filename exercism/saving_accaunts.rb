module SavingsAccount
  NEGATIVE_BALANCE_RATE = 3.213
  SMALL_BALANCE_RATE = 0.5
  MEDIUM_BALANCE_RATE = 1.621
  LARGE_BALANCE_RATE = 2.475
  PERCENT = 100

  SMALL_BALANCES = (0...1_000)
  MEDIUM_BALANCES = (1_000...5_000)

  def self.interest_rate(balance)
    return NEGATIVE_BALANCE_RATE if balance.negative?
    return SMALL_BALANCE_RATE if SMALL_BALANCES.cover?(balance)
    return MEDIUM_BALANCE_RATE if MEDIUM_BALANCES.cover?(balance)

    LARGE_BALANCE_RATE
  end

  def self.rate_as_fraction(balance)
    interest_rate(balance) / PERCENT
  end

  def self.annual_balance_update(balance)
    rate_as_fraction(balance) * balance + balance
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    years = 0
    until current_balance >= desired_balance
      current_balance = annual_balance_update(current_balance)
      years += 1
    end
    years
  end
end

test2 = SavingsAccount.annual_balance_update(200.75)

p test2 