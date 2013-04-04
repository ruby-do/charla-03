require 'test_helper'

class TeacherTest < ActiveSupport::TestCase

	test "tengo data" do
		assert Teacher.all.count > 0
	end

	test "aumento por antiguedad >= 10 years" do

		teacher = teachers(:one)

		salario_actual = teacher.salary

		teacher.aumento_por_antiguedad()

		salario_nuevo = teacher.salary

		assert_equal true, salario_actual < salario_nuevo, 'Corresponde aumento'

	end

	test "aumento por antiguedad < 10 years" do

		teacher = teachers(:two)

		salario_actual = teacher.salary

		teacher.aumento_por_antiguedad()

		salario_nuevo = teacher.salary

		assert_equal true, salario_actual == salario_nuevo, 'NO corresponde aumento'

	end

	test "aumento por cantidad de tandas +1" do
		
		teacher = Teacher.find_by_shifts(2)

		salario_actual = teacher.salary

		teacher.aumento_por_tandas()

		assert_equal true, salario_actual < teacher.salary, 'Si corresponde aumento'

	end

	test "aumento por cantidad de tandas 1" do
		
		teacher = Teacher.find_by_shifts(1)

		salario_actual = teacher.salary

		teacher.aumento_por_tandas()

		assert_equal true, salario_actual == teacher.salary, 'NO corresponde aumento'
	end

	test "aplica para el plan de retiro" do
		teacher_viejo = teachers(:one)
		teacher_viejo.years = 6

		teacher_nuevo = teachers(:two)
		teacher_nuevo.years = 3

		assert_equal true, teacher_viejo.puede_retirarse(), 'Le corresponde el retiro'
		assert_equal false, teacher_nuevo.puede_retirarse(), 'No le corresponde el retiro'

	end

end
