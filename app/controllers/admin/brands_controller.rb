class Admin::BrandsController < AdminController

	def new
		#byebug
		@brand = Brand.new
		respond_to do |format|
			format.js
		end
	end

	def create
		@brand = Brand.new(title: params[:brand][:title])
		respond_to do |format|
			if @brand.save
				format.js
			else
				format.js
			end
		end
	end
	
end