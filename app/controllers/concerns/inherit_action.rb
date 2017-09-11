module InheritAction
  extend ActiveSupport::Concern

	included do
  	before_action :get_resource, only: [:show, :edit, :update, :destroy]
	end

	def index
		@resources = resource_class.all.order('updated_at DESC')
		respond_to do |format|
			format.html
			format.json { render json: @resources }
		end
	end

	def new
		@resource = resource_class.new(resource_params)
	end

	def create
		@resource = resource_class.new(resource_params)
		respond_to do |format|
			if @resource.save
				format.html { redirect_to configure_redirect_path, notice: resource_class.to_s + ' was successfully created.'}
				format.json { render :index, status: :ok, location: @resource }
			else
				format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
			end
		end
	end

	def show
		@resource = resource_class.find(params[:id])
	end

	def edit
	end

	def update
		respond_to do |format|
	    if @resource.update_attributes(resource_params)
				format.html { redirect_to @resource, notice: resource_class.to_s + ' was successfully updated.' }
        format.json { render :index, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@resource.destroy
		respond_to do |format|
      format.html { redirect_to configure_redirect_path, notice: resource_class.to_s + ' was successfully destroyed.' }
      format.json { head :no_content }
    end
	end

	private

	def get_resource
		@resource ||= resource_class.find(params[:id])
	end

	def resource_class
		resource_name.classify.constantize
	end

	def resource_params
    params.fetch(resource_name, {}).permit(permitted_attributes)
	end

	def permitted_attributes
		resource_class.column_names
	end

	def configure_redirect_path
		"/#{controller_name}"
	end

	def resource_name
		controller_name.singularize
	end

end