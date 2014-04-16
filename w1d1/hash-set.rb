def set_add_el(set, val)
  set[val] = true unless set.has_key?(val)
  set
end


def set_remove_el(set, val)
  set.delete(val) if set.has_key?(val)
  set
end

def set_list_els(set)
  set.keys
end

def set_member?(set, val)
  set.has_key?(val)
end

def set_union(set1, set2)
  set1.merge(set2)
end

def set_intersection(set1, set2)
  # new_hash = Hash.new
  new_hash = {}

  set1.keys.each do |key|
    new_hash[key] = set1[key] if set2.keys.include?(key)
  end

  new_hash
end

def set_minus(set1, set2)
  # new_hash = Hash.new
  new_hash = {}

  set1.keys.each do |key|
    new_hash[key] = set1[key] unless set2.keys.include?(key)
  end

  new_hash

end


