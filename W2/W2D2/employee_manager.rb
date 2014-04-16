class Employee
  attr_accessor :name, :title, :salary, :boss

  def initialize(name, title = nil, salary = nil, boss = nil)
    @name, @title, @salary, @boss = name, title, salary, boss
  end

  def to_s
    @name
  end

  def bonus(multiplier = 1)
    @salary * multiplier
  end

end

class Manager < Employee
  attr_accessor :employee_array

  def initialize(name, title, salary, boss, *employees)
    super(name, title, salary, boss)
    @employee_array = employees
  end

  def add_employee(employee)
    @employee_array << employee
  end

  def bonus(multiplier = 1)
    empl_bonus = @salary
    @employee_array.each{|employee| empl_bonus += employee.bonus}
    empl_bonus * multiplier
  end

end
