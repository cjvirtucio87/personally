class BusinessesController < ApplicationController
  before_action :prep_soda

  def index
    @businesses = Business.all
  end

  def create
    qparams = { '$q' => 'EASTMAN', '$limit' => '3' }
    data = query_soda(qparams)
    @business = Business.new(data.first.to_h)
    if @business.save
      flash[:success] = "Business saved."
      redirect_to businesses_path
    else
      flash[:notice] = "Couldn't save business."
      redirect_to businesses_path
    end
  end

end
