class Account
  attr_reader :name
  attr_reader :balance
  def initialize(name, balance=100)
    @name = name
    @balance = balance
  end
  
  public
  def display_balance(pin_number)
    if pin_number == @pin
      puts "Balance: $#{@balance}."
    else
      puts pin_error
    end
  end
  
  def withdraw(pin_number,amount)
    if pin_number == @pin
      @balance -= amount
      puts "Withdrew #{amount}."
    elsif @balance < amount
      puts "You don't have enough money to withdraw #{amount}. \n Current balance: #{@balance}."
    else
      puts pin_error
    end
  end

  def deposit(pin_number, amount)
    if pin_number == @pin
      @balance += amount
      puts "Deposited #{amount}. New Balance: #{@balance}"
    else
      puts pin_error
    end
  end

  private
  def pin
    @pin = 1234
  end
  def pin_error
    return "Access denied: incorrect PIN."
  end 
end

checking_account = Account.new("Eric", 1_000_000)
checking_account.deposit(1234, 1000)

class CheckingAccount < Account; end
class SavingsAccount < Account; end
