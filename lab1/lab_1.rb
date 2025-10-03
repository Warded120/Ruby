
def book_price(pages, tirage)

  puts "Розрахунок для книги #{pages} ст. та тиражу #{tirage}"

  # 1. Авторський гонорар
  honorar = 24.0 * pages

  # 2. Оформлення
  design = honorar * 0.30

  # 3. Набір
  typesetting = 1.2 * pages

  # 4. Редакційні витрати
  editorial_total = honorar + design + typesetting
  editorial_per_book = editorial_total / tirage

  # 5. Типографські витрати
  paper = 0.16 * pages + 3
  ink = 0.04 * pages
  amortization = 0.08 * pages

  # 6. Собівартість (на 1 екземпляр)
  cost_price = editorial_per_book + paper + ink + amortization

  # 7. Прибуток (на весь тираж)
  profit_total = cost_price * tirage * 0.23
  profit_per_book = profit_total / tirage

  # 8. Податок (на 1 екземпляр)
  tax_per_book = (cost_price + profit_per_book) * 0.30

  # 9. Загальна вартість (на 1 екземпляр)
  total_price_per_book = cost_price + profit_per_book + tax_per_book

  # Вивід результатів
  puts "Авторський гонорар: #{honorar.round(2)} грн"
  puts "Собівартість книги: #{cost_price.round(2)} грн"
  puts "Прибуток видавництва від всього тиражу: #{profit_total.round(2)} грн"
  puts "Податок на один екземпляр: #{tax_per_book.round(2)} грн"
  puts "Загальна вартість одного екземпляру: #{total_price_per_book.round(2)} грн"
end

# Приклад виклику
book_price(50, 1000)
