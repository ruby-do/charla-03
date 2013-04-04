class Teacher < ActiveRecord::Base
  attr_accessible :name, :salary, :shifts, :years

  def aumento_por_antiguedad()

  	if self.years >= 10
  		self.salary = self.salary * 1.10
  	end

  end

  def aumento_por_tandas()

  	if self.shifts > 1
  		self.salary = self.salary * 1.05
  	end

  end

  def puede_retirarse()
  	if self.years > 5
  		return true
  	else
  		return false
  	end
  end

end
