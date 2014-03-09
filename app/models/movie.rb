class Movie < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	has_one :movie_meta
	validates :title, presence: true, length: {minimum: 5}
end
