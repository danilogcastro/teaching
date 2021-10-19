require 'open-uri'
require 'nokogiri'

def fetch_movie_urls
  url = "https://www.imdb.com/chart/top"
  html = URI.open(url).read
  doc = Nokogiri::HTML(html)

  movies = doc.search(".titleColumn a")[0..4]

  movies.map do |movie|
    "https://www.imdb.com#{movie.attribute('href').value}"
  end
end

def scrape_movie(url)
  doc = Nokogiri::HTML(URI.open(url, "Accept-Language" => "en-US").read)

  title = doc.search("h1").text
  year = doc.search(".ipc-inline-list__item .jedhex").text.match(/(?<year>\d{4})/)[:year]
  director = doc.search(".ipc-metadata-list__item:contains('Director') a").children.first.text
  storyline = doc.search(".GenresAndPlot__TextContainerBreakpointL-cum89p-1").text
  cast = doc.search(".StyledComponents__ActorName-y9ygcu-1").first(3).map { |actor| actor.text }

  {
    cast: cast,
    director: director,
    storyline: storyline,
    title: title,
    year: year.to_i
  }
end

# p scrape_movie("https://www.imdb.com/title/tt0111161/")