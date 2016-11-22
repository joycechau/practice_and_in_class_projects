class Employee
  attr_reader :salary

  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    add_subordinate
  end

  def add_subordinate
    @boss.subordinates << self unless @boss.nil?
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee
  attr_reader :subordinates, :boss, :salary

  def initialize(name, title, salary, boss)
    super
    @subordinates = []
  end

  def bonus(multiplier)
    total_subordinate_salaries * multiplier
  end

  def total_subordinate_salaries
    total = 0
    @subordinates.each do |subordinate|
      if subordinate.is_a?(Manager)
        total += subordinate.salary + subordinate.total_subordinate_salaries
      else
        total += subordinate.salary
      end
    end

    total
  end

end

ned = Manager.new("Ned", "Founder", 1_000_000, nil)
darren = Manager.new("Darren", "TA Manager", 78_000, ned)
shawna = Employee.new("Shawna", "TA", 12_000, darren)
david = Employee.new("David", "TA", 10_000, darren)

puts ned.bonus(5) # => 500_000
puts darren.bonus(4) # => 88_000
puts david.bonus(3) # => 30_000
