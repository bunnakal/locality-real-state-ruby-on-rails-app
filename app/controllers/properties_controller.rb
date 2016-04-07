class PropertiesController < ApplicationController
	def index
		if request.post?
			sql = []
			condition = []
			if params[:status].present?
				sql << "status = ? "
				condition << params[:status] 
			end
			if params[:beds].present?
				sql << "beds = ? "
				condition << params[:beds] 
			end
			if params[:baths].present?
				sql << "baths = ?"
				condition << params[:baths]
			end
			if params[:state].present?
				sql << "state = ? "
				condition << params[:state]
			end
			if params[:district].present?
				sql << "district = ? "
				condition << params[:district]
			end
			if params[:from].present? and params[:to].present?
				sql << "price between ? AND ?"
				condition << params[:from] << params[:to]
			end
			# binding.pry 
			sql = sql.join(" AND ")
			@properties=Property.where(sql, *condition)
			.paginate(:page => params[:page], :per_page => 4)
		else
			if params[:type_id]
				@t= Type.find(params[:type_id])
				@properties = @t.properties
					.order('created_at DESC')
					.paginate(:page => params[:page], :per_page => 4)
			else
				@properties = Property
				.order('created_at DESC')
				.paginate(:page => params[:page], :per_page => 4)
			end
		end
		@types= Type.all.order('property_type')
		@f_properties = Property.where("price >= ?", Property::FEATURE_PRICE)
		.order('created_at DESC').take(2)
		@contact_info= User.find_by(role: 'admin')
	end
	def show
		@property = Property.find(params[:id])
		@galleries = @property.galleries
	end
	def new
		@property = Property.new
		@types= Type.all.order('property_type')
		@property_gallery = @property.galleries.build
	end
	def edit
		@property = Property.find(params[:id])
		@types= Type.all.order('property_type')
	end
	def update
		@property = Property.find(params[:id])
    if @property.update(property_params) and params[:property_galleries].present?
	    params[:property_galleries]['image_gallery'].each do |g|
	    	@property_gallery = @property.galleries.create!(:image_gallery => g,
	    	 :property_id => @property.id)
	   	end
    end
    redirect_to @property
	end
	def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to view_path
  end
	def create
		@property = Property.new(property_params) 
		@property.user_id = current_user.id
    if @property.save and params[:property_galleries].present?
      params[:property_galleries]['image_gallery'].each do |g|
      	@property_gallery = @property.galleries.create!(:image_gallery => g,
      	 :property_id => @property.id)
      end
      redirect_to @property, notice: 'Property was successfully published.'
    else
       render action: 'new' 
    end
	end
	def view
		@v_properties = Property.where("user_id = ?", current_user.id)
	end
	def about

	end
private
	def property_params
		params.require(:property).permit(:title, :description, :status, 
			:price, :spec, :beds, :baths, :state, :district, :address, 
			:image, :type_id,:latitude,:longitude,
			property_galleries_attributes: [:id, :property_id, :image_gallery])
	end
end
