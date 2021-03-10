require_relative 'film'
require 'nokogiri'
require 'open-uri'

module Parser
  extend self

  IMBD = 'https://www.imdb.com/list/ls055592025/'

  def parse_films(url = IMBD)
    doc = Nokogiri::HTML(URI.open(url))

    doc.css('div.lister-item-content').map do |item|
      title = item.at('h3.lister-item-header > a').text
      director = item.at('p.text-muted.text-small > a').text
      year = item.at('h3.lister-item-header > span.lister-item-year.text-muted.unbold').text

      Film.new(title, director, year)
    end
  end
end
