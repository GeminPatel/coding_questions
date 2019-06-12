require 'csv'
arr = CSV.read("/Users/gemin.patel/Desktop/input3.csv").first.map(&:to_i)

p arr.length

max_profit = 0
best_buy = 1000000000
best_sell = -1
current_buy = 100000000
current_buy_index = 0
buy_index = 0
sell_index = 0

arr.each_with_index do |price, i|
  if price - current_buy > max_profit
    puts "22"
    max_profit = price - current_buy
    best_buy = current_buy
    best_sell = price
    buy_index = current_buy_index
    sell_index = i
  elsif price < best_buy
    puts "11"
    current_buy = price
    current_buy_index = i
  end
end


p buy_index
p sell_index
p max_profit
