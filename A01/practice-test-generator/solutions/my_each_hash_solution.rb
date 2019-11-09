class Hash
  # Write a `Hash#my_each(&prc)` that calls a proc on each key, value pair.
  # **Do NOT use the built-in `Hash#each`, `Hash#map`, `Hash#each_with_index` 
  # methods in your implementation.**
  
  def my_each(&prc)
    i = 0
    while i < keys.length
      prc.call(keys[i], self[keys[i]])
      i += 1
    end
    self
  end
end
