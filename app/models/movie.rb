class Movie < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	has_one :movie_meta
	validates :title, presence: true, length: {minimum: 5}, uniqueness: true
	before_validation :add_meta

	def add_meta
		imdb = Tmdb::Movie.find(self.title)
		if imdb.length == 0
			errors.add(self.title, 'is an invalid movie title')
			return false
		end
		d = Tmdb::Movie.detail(imdb[0].id)
		self.create_movie_meta({revenue: d.revenue, length: d.runtime, budget: d.budget, poster: d.poster_path, homepage: d.homepage, description: d.overview, tagline: d.tagline, popularity: d.vote_average, release_date: d.release_date})
	end
end
