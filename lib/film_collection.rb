require_relative 'film'

class FilmCollection
  attr_reader :films

  def initialize(films_collection)
    @films = films_collection
  end

  def directors
    @films.map(&:director).uniq
  end

  def chose_film_by_director(selected_director)
    @films.select { |film| film.director == selected_director }
  end
end
