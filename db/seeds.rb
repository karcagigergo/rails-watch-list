require 'open-uri'
require 'json'
require 'rest-client'

puts "Cleaning up database..."
Movie.destroy_all
puts "Database cleaned"

url = "http://tmdb.lewagon.com/movie/top_rated"

response = RestClient.get(url) 
# array to store the response
results = JSON.parse(response.body)
results['results'].each do |movie|
  puts "Creating #{movie['title']}"
  base_poster_url = "https://image.tmdb.org/t/p/original"
  Movie.create(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "#{base_poster_url}#{movie['poster_path']}",
    rating: movie['vote_average'].to_f
  )
end
puts "Movies created"
