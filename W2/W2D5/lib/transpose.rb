def my_transpose(matrix)
  raise "Not a matrix" unless matrix.all? { |row| row.count == matrix[0].count }
  return matrix if matrix.empty?
  transposed_matrix = []
  matrix[0].count.times do |col_i|
    new_row = Array.new
    matrix.each do |row|
      new_row << row[col_i]
    end
    transposed_matrix << new_row
  end
  transposed_matrix

end