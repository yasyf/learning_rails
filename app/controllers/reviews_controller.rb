class ReviewsController < ApplicationController

	def create
		@movie = Movie.find(params[:movie_id])
		@review = @movie.reviews.create(review_params)
		@review.user = current_user
		@review.save
		respond_to do |format|
			format.html { redirect_to movie_path(@movie) }
			format.js
		end
	end

	def destroy
		@movie = Movie.find(params[:movie_id])
		@review = @movie.reviews.find(params[:id])
		if current_user.email != @review.user.email
			return
		end
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
