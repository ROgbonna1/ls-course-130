=begin
Kindergarteners growing grass, clover, radishes, and violets [GCRV]
12 Children in the class (A..L).to_a
Two rows of 24 plants.
Each kid gets two plants on each row

[window][window][window]
VRCGVVRVCGGCCGVRGCVCGCGV
VRCCCGCRRGVCGCRVVCVGCGCV

Places go in order from left to right
Same positions on top and bottom row. 
Kids basically get a 2x2 square of space.

Upon initilization, Garden takes a diagram and an array of students,
(A..L) as the default

Algorithm
- I'm thinking matching kids using regex based on positions after whitespace
=end

class Garden
  TEST_STUDENTS = %w(Alice Bob Charlie David Eve Fred Ginny Harriet Ileana Joseph Kincaid Larry)
  PLANTS = { g: "grass", c: "clover", v: "violets", r: "radishes" }
  
  attr_reader :students, :row1, :row2

  def initialize(diagram, students = TEST_STUDENTS)
    @students = students.sort
    fix_rows(diagram)
    create_readers(@students)
  end
  
  private
  
  def create_readers(students)
    @students.each do |student|
      self.class.send(:define_method, student.downcase.to_sym) {retrieve_plants(student)}
    end
  end
  
  def fix_rows(diagram)
    @row1, @row2 = diagram.split(/\n/)
    @row1, @row2 = @row1.scan(/[GVCR]{2}/), @row2.scan(/[GVCR]{2}/)
  end
  
  def plants_array(student)
    [row1[students.index(student)], row2[students.index(student)]]
  end
  
  def retrieve_plants(student)
    plants = plants_array(student)
    plants.map do |pair|
      pair.split(//).map { |letter| PLANTS[letter.downcase.to_sym].to_sym}
    end.flatten
  end
end
