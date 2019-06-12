# @param {String} word1
# @param {String} word2
# @return {Integer}
def min_distance(word1, word2)
    store = Array.new(word1.length) { Array.new(word2.length) { nil } }
    _min_distance(word1.split(''), word2.split(''), store)
end

def _min_distance(word1, word2, index1=0, index2=0, store)
  return word1.length - index1 if index2 == word2.length
  return word2.length - index2 if index1 == word1.length
  
  return store[index1][index2] if store[index1][index2]
  
  if word1[index1] == word2[index2]
    ans = _min_distance(word1, word2, index1 + 1, index2 + 1, store)
  else
    ans = 1 + [_min_distance(word1, word2, index1 + 1, index2 + 1, store), _min_distance(word1, word2, index1 + 1, index2, store), _min_distance(word1, word2, index1, index2 + 1, store)].min
  end
  
  store[index1][index2] = ans
end
