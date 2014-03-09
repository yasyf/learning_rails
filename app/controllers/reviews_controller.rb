class ReviewsController < ApplicationController
	http_basic_authenticate_with name: "admin", password: "12345!", only: :destroy

	def create
		@movie = Movie.find(params[:movie_id])
		@review = @movie.reviews.create(review_params)
		respond_to do |format|
			format.html { redirect_to movie_path(@movie) }
			format.js
		end
	end

	def destroy
		@movie = Movie.find(params[:movie_id])
		@review = @movie.reviews.find(params[:id])
		@review.destroy
		respond_to do |format|
			format.html { redirect_to movie_path(@movie) }
			format.js
		end
	end

	private
		def review_params
			params.require(:review).permit(:user, :body)
		end
end
