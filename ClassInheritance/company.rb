require 'byebug'

class Employee

  attr_accessor :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end

end

class Manager < Employee

  attr_accessor :name, :title, :salary, :boss, :employees

  def initialize(name, title, salary, boss, employees=[])
    super(name, title, salary, boss)
    @employees = employees
  end

  def bonus(multiplier)
    total_salary = 0
    @employees.each do |employee|
      total_salary += employee.salary
    end
    total_salary * multiplier
  end

end

employees = []

employees <<  Employee.new("Shawna", "TA", 12_000, "Darren")
employees <<  Employee.new("David", "TA", 10_000, "Darren")
employees << Manager.new("Ned", "Founder", 1_000_000, nil)
employees << Manager.new("Darren", "TA Manager", 78_000, "Ned")

managers = employees.select{|employee|employee.class == Manager}

employees.each do |employee|
  managers.each do |manager|
    if manager.name == employee.boss
      manager.employees += [employee]
    end
  end
end

employees.each do |employee|
  puts employee.bonus(1)
end


# man_emp_hash = {}
#
# employees.each do |employee|
#   employee.each do |employee|
#
#   end
# end

# Ned	$1,000,000	Founder	nil
# Darren	$78,000	TA Manager	Ned
# Shawna	$12,000	TA	Darren
# David	$10,000	TA	Darren
