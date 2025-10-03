def calc_apartment_cost(area, material, floor, district, style, category)
  # --- 1. Собівартість ---
  material_index = case material
                   when 1 then 300  # Панельний / Бетон
                   when 2 then 500  # Цегляний / Цегла
                   when 3 then 800  # Композит
                   else
                     raise "Невірний вибір матеріалу!"
                   end

  cost_price = area * material_index

  # --- 2. Розміщення ---
  floor_coef = if [1, 2, 8, 9].include?(floor) || floor >= 10 && (floor - 1) % 8 == 0
                 1.1
               else
                 1.4
               end

  district_coef = case district
                  when 1 then 1.7  # Центр
                  when 2 then 1.4  # Спальний
                  when 3 then 1.15 # Приміський
                  else
                    raise "Невірний вибір району!"
                  end

  rm = cost_price * floor_coef * district_coef

  # --- 3. Вартість забудовника ---
  arch_coef = case style
              when 1 then 2.0   # Хайтех
              when 2 then 1.7   # Ексклюзів
              when 3 then 1.5   # Індивідуал
              when 4 then 1.05  # Стандарт
              else
                raise "Невірний вибір стилю!"
              end

  developer_price = rm * arch_coef

  # --- 4. Загальна вартість (з податком) ---
  tax_coef = case category
             when 1 then 1.75  # Елітна
             when 2 then 1.5   # Бюджетна
             when 3 then 1.07  # Пільгова
             else
               raise "Невірний вибір категорії!"
             end

  total_price = developer_price * tax_coef

  return {
    cost_price: cost_price.round(2),
    developer_price: developer_price.round(2),
    total_price: total_price.round(2)
  }
end

# --- Інтерактивне меню ---
if __FILE__ == $0
  puts "Введіть площу квартири (в м²):"
  area = gets.chomp.to_f

  puts "\nОберіть матеріал:"
  puts "1 - Панельний / Бетон"
  puts "2 - Цегляний / Цегла"
  puts "3 - Композит"
  material = gets.chomp.to_i

  puts "\nВведіть поверх (число):"
  floor = gets.chomp.to_i

  puts "\nОберіть район:"
  puts "1 - Центр"
  puts "2 - Спальний"
  puts "3 - Приміський"
  district = gets.chomp.to_i

  puts "\nОберіть архітектурний стиль:"
  puts "1 - Хайтех"
  puts "2 - Ексклюзів"
  puts "3 - Індивідуал"
  puts "4 - Стандарт"
  style = gets.chomp.to_i

  puts "\nОберіть категорію:"
  puts "1 - Елітна"
  puts "2 - Бюджетна"
  puts "3 - Пільгова"
  category = gets.chomp.to_i

  # Обчислення
  begin
    result = calc_apartment_cost(area, material, floor, district, style, category)

    puts "\n--- Результати розрахунку ---"
    puts "Собівартість (СВ): #{result[:cost_price]}"
    puts "Вартість забудовника (ПЗ): #{result[:developer_price]}"
    puts "Загальна вартість (ЗВ): #{result[:total_price]}"
  rescue => e
    puts "Помилка: #{e.message}"
  end
end
