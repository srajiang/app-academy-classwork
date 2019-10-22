require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name, @funding, @salaries = name, funding, salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.keys.include?(title)
    end

    def >(startup)
        @funding > startup.funding
    end

    def hire(employee_name, title)
        if !valid_title?(title)
            raise 'invalid title supplied'
        else
            @employees << Employee.new(employee_name,title)
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        salary = @salaries[employee.title]
        if @funding >= salary
            employee.pay(salary)
            @funding -= salary
        else
            raise 'need more $$$'
        end
    end

    def payday
        @employees.each { |employee| pay_employee(employee) } 
    end


    def average_salary
        salaries = @employees.map {|employee| @salaries[employee.title]}
        salaries.sum / salaries.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        @salaries = startup.salaries.merge(@salaries)
        @employees += startup.employees
        startup.close
    end
end
