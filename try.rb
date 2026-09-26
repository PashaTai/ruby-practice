loop do
    puts "Напиши что-нибудь (stop — выход):"
    text = gets.chomp
    break if text == "stop"
    puts "Ты написал: #{text}"
  end
  puts "Конец"