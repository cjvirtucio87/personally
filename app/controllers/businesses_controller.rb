class BusinessesController < ApplicationController
  before_action :prep_soda

  def index
    @businesses = Business.all
  end

  def new
    @business = Business.new
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

  private

    def business_params
      params.require(:business).permit(
        :id,
        :user_id,
        :ttxid,
        :certificate_number,
        :ownership_name,
        :dba_name,
        :full_business_address,
        :city,
        :state,
        :business_zip,
        :dba_start_date,
        :dba_end_date,
        :location_start_date,
        :location_end_date,
        :mailing_address_1,
        :mailing_city_state_zip_code,
        :location
        )
    end

end
