def transpose(matrix)

  newMatrix = Array.new(matrix[0].length) { [] }

  matrix.each do |array|
    array.each_with_index do |item, i|
      newMatrix[i] << item
    end
  end

  return newMatrix
end
