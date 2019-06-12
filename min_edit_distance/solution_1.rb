# @param {String} word1
# @param {String} word2
# @return {Integer}
def min_distance(word1, word2)
    _min_distance(word1.split(''), word2.split(''))
end

def _min_distance(word1, word2, index1=0, index2=0)
  return word1.length - index1 if index2 == word2.length
  return word2.length - index2 if index1 == word1.length
  
  if word1[index1] == word2[index2]
    _min_distance(word1, word2, index1 + 1, index2 + 1)
  else
    1 + [_min_distance(word1, word2, index1 + 1, index2 + 1), _min_distance(word1, word2, index1 + 1, index2), _min_distance(word1, word2, index1, index2 + 1)].min
  end
end
