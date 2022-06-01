require "employee"

class Startup
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def name
        @name
    end

    def funding
        @funding
    end

    def salaries
        @salaries
    end

    def employees
        @employees
    end

    def valid_title?(title)
        salaries.has_key?(title)
    end

    def >(startup)
        return self.funding > startup.funding
    end

    def hire(employee_name, title)
        unless salaries.has_key?(title)
            raise ArguementError.new "no title"
        end

        employees << Employee.new(employee_name, title)
    end

    def size
        employees.length
    end

    def pay_employee(employee)
        unless @funding > salaries[employee.title]
            raise ArguementError.new "no funding"
        end
            
        employee.pay(salaries[employee.title])
        @funding -= salaries[employee.title]
    end

    def payday
        @employees.each {|employee| pay_employee(employee)}
    end

    def average_salary
        sum = 0
        @employees.each {|employee| sum += salaries[employee.title]}
        sum / employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        @employees += startup.employees
        startup.close
        startup.salaries.each do |key, value|
            if !@salaries.has_key?(key)
                @salaries[key] = value
            end
        end
    end
end
