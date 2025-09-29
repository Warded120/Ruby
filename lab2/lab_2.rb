# apartment_price.rb

def calc_apartment_cost(area, material, floor, district, style, category)
  # --- 1. Собівартість ---
  material_index = case material.downcase
                   when "панельний", "бетон" then 300
                   when "цегляний", "цегла" then 500
                   when "композит", "композитний" then 800
                   else
                     raise "Невідомий матеріал!"
                   end

  cost_price = area * material_index

  # --- 2. Розміщення ---
  floor_coef = if [1, 2, 8, 9].include?(floor) || floor >= 10 && (floor - 1) % 8 == 0
                 1.1
               else
                 1.4
               end

  district_coef = case district.downcase
                  when "центр" then 1.7
                  when "спальний" then 1.4
                  when "приміський" then 1.15
                  else
                    raise "Невідомий район!"
                  end

  rm = cost_price * floor_coef * district_coef

  # --- 3. Вартість забудовника ---
  arch_coef = case style.downcase
              when "хайтех" then 2.0
              when "ексклюзів" then 1.7
              when "індивідуал" then 1.5
              when "стандарт" then 1.05
              else
                raise "Невідомий стиль!"
              end

  developer_price = rm * arch_coef

  # --- 4. Загальна вартість (з податком) ---
  tax_coef = case category.downcase
             when "елітна" then 1.75
             when "бюджетна" then 1.5
             when "пільгова" then 1.07
             else
               raise "Невідома категорія!"
             end

  total_price = developer_price * tax_coef

  # Повертаємо результати
  return {
    cost_price: cost_price.round(2),
    developer_price: developer_price.round(2),
    total_price: total_price.round(2)
  }
end

# --- Демонстрація ---
if __FILE__ == $0
  # приклад з умови
  result = calc_apartment_cost(85, "композит", 5, "центр", "стандарт", "бюджетна")

  puts "Собівартість (СВ): #{result[:cost_price]}"
  puts "Вартість забудовника (ПЗ): #{result[:developer_price]}"
  puts "Загальна вартість (ЗВ): #{result[:total_price]}"
end
