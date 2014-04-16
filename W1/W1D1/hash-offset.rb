def correct_offset(hash)
  new_hash = {}
  hash.keys.each do |key|
    new_hash[key.next] = hash[key]
  end
  new_hash
end

def correct_offset(hash)
  new_hash = {}
  keys = hash.keys

  keys.each_index do |i|
    new_hash[keys[(i + 1) % keys.length]] = hash[keys[i]]
  end
  new_hash
end