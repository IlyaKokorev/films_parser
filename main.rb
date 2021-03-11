require_relative 'lib/film'
require_relative 'lib/film_collection'
require_relative 'lib/parser'

user_choice = 0

puts 'Программа "Фильм на вечер"'

films = FilmCollection.new(Parser.parse_films)

directors = films.collect_director

puts 'Какой режиссер Вам интересен?'

directors.each.with_index(1) { |director, index| puts "#{index}. #{director}" }

while user_choice != 1
  puts "Введите число от 1 до #{directors.size}"

  user_input = STDIN.gets.to_i

  redo unless user_input.between?(1, directors.size)

  selected_films = films.chose_film_by_director(directors[user_input - 1])

  puts <<~render
  Рекомендую посмотреть:
  #{selected_films.sample}
  Введите "1", если Вас устраивает выбранный фильм. Или нажмите любую клавишу, чтобы найти еще.
  render

  user_choice = STDIN.gets.to_i

  puts 'Приятного просмотра!' if user_choice == 1
end
