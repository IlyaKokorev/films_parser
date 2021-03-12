require_relative 'lib/film'
require_relative 'lib/film_collection'
require_relative 'lib/parser'

puts 'Программа "Фильм на вечер"'

films = FilmCollection.new(Parser.parse_films)

directors = films.directors

puts 'Какой режиссер Вам интересен?'

directors.each.with_index(1) { |director, index| puts "#{index}. #{director}" }

user_choice = 0

while user_choice != 1
  puts "Введите число от 1 до #{directors.size}"

  user_input = STDIN.gets.to_i

  user_director = user_input - 1

  redo unless user_director.between?(0, directors.size)

  selected_films = films.chose_film_by_director(directors[user_director])

  puts <<~RENDER
    Рекомендую посмотреть:
    #{selected_films.sample}
    Введите "1", если Вас устраивает выбранный фильм. Или нажмите любую клавишу, чтобы найти еще.
  RENDER

  user_choice = STDIN.gets.to_i
end

puts 'Приятного просмотра!'
