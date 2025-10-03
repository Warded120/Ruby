
n = 12
ba = [3, 6, 11, 5, 6, 7, 6, 5]   # безалкогольні замовлення
al = [10, 6, 9, 5, 6, 9, 5]      # алкогольні замовлення

# 1. Загальний список та кількість замовлень
all_orders = []
for i in 0...ba.size
  all_orders << ba[i]
end
for i in 0...al.size
  all_orders << al[i]
end
puts "1. Загальний список замовлень: #{all_orders.inspect}"
puts "   Загальна кількість замовлень = #{all_orders.size}"

# 2. Список та кількість клієнтів, що відвідали кафе
clients_today = []
for i in 0...all_orders.size
  client = all_orders[i]
  already_in = false
  for j in 0...clients_today.size
    if clients_today[j] == client
      already_in = true
      break
    end
  end
  clients_today << client unless already_in
end
puts "2. Список клієнтів, що відвідали кафе: #{clients_today.inspect}"
puts "   Кількість клієнтів = #{clients_today.size}"

# 3. Кількість «безалкогольних» замовлень
puts "3. Кількість безалкогольних замовлень = #{ba.size}"

# 4. Клієнти «безалкогольних» замовлень
ba_clients = []
for i in 0...ba.size
  client = ba[i]
  already_in = false
  for j in 0...ba_clients.size
    if ba_clients[j] == client
      already_in = true
      break
    end
  end
  ba_clients << client unless already_in
end
puts "4. Клієнти безалкогольних замовлень: #{ba_clients.inspect}"
puts "   Кількість клієнтів = #{ba_clients.size}"

# 5. Кількість «алкогольних» замовлень
puts "5. Кількість алкогольних замовлень = #{al.size}"

# 6. Клієнти «алкогольних» замовлень
al_clients = []
for i in 0...al.size
  client = al[i]
  already_in = false
  for j in 0...al_clients.size
    if al_clients[j] == client
      already_in = true
      break
    end
  end
  al_clients << client unless already_in
end
puts "6. Клієнти алкогольних замовлень: #{al_clients.inspect}"
puts "   Кількість клієнтів = #{al_clients.size}"

# 7. Клієнти, що робили обидва типи замовлень
both = []
for i in 0...ba_clients.size
  client = ba_clients[i]
  for j in 0...al_clients.size
    if client == al_clients[j]
      already_in = false
      for k in 0...both.size
        if both[k] == client
          already_in = true
          break
        end
      end
      both << client unless already_in
    end
  end
end
puts "7. Клієнти, що робили обидва типи замовлень: #{both.inspect}"
puts "   Кількість клієнтів = #{both.size}"

# 8. Клієнти, що не відвідували кафе
not_visited = []
for i in 1..n
  client = i
  visited = false
  for j in 0...clients_today.size
    if clients_today[j] == client
      visited = true
      break
    end
  end
  not_visited << client unless visited
end
puts "8. Клієнти, що не відвідували кафе: #{not_visited.inspect}"
puts "   Кількість клієнтів = #{not_visited.size}"
