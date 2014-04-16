# def cipher (message, shift)
#   base = 'a'.ord
#   new_message = ""
#   message.split("").each do |char|
#
#     if char >= 'a' && char <= 'z'
#       pos = ((char.ord - base) + shift) % 26 + base
#       new_message += pos.chr
#     else
#       new_message += char
#     end
#
#   end
#
#   return new_message
# end


def cipher(message, shift)
  alphabet = ('a'..'z').to_a

  message.split('').map do |el|
    alphabet.include?(el) ? alphabet[alphabet.index(el) + shift % 26] : el
  end.join('')

end