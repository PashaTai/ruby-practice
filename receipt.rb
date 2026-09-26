item_boots = {name: 'Ботинок', price: 22000}
item_sockets = {name: 'Носки', price: 100}
item_sparkle_drink = {name: 'Газировка', price: 50}

items = [ item_boots, item_sockets, item_sparkle_drink ]

lines = []

magazine = "Впрок"
lines << "Магазин: #{magazine}"
lines << "Дата: #{Time.now}"

items.each do |item|
    lines << "#{item[:name]} - #{item[:price]}"
end


def total(items)
    sum = 0
    items.each do |item|
        sum += item[:price]
    end
    return sum
end 

sum = total(items)

lines << "Итого: #{sum}"

if sum >= 1000 
    discount = (sum * 0.9).round
    lines << "Итого с учетом скидки: #{discount}"
end

text = lines.join("\n")
puts text

File.write("receipt.txt", text)
