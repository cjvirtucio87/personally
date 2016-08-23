class BusinessesController < ApplicationController
  before_action :prep_soda

  def index
    @businesses = Business.all
  end

  def new
    @business = current_user.build_business
  end

  def show
    @business = Business.find(params[:id])
    # CompareBusinessJob.perform_now(@business.ttxid)
  end

  def create
    if params['selected']
      data = query_selected.first.to_h
      @business = current_user.build_business(data)
      if @business.save
        flash[:success] = "Business saved."
        redirect_to @business
      else
        flash[:notice] = "Business could not be saved."
        redirect_to new_business_path
      end
    else
    # begin
      # Attempt with hashify_query
      hash_query = query_soda(hashify_query)
      if hash_query.empty?
        # Attempt with stringify_query
        string_query = query_soda('$q' => stringify_query)
        if string_query.empty?
          flash[:notice] = "Couldn't find a business with that information"
          redirect_to new_business_path
        else
          # More than one result
          if string_query.count > 1
            @data = string_query.map { |result| result.ttxid }
            @business = current_user.build_business
            flash.now[:success] = "We've found more than one result."
            render :new
          else
            @business = current_user.build_business(string_query.first.to_h)
            if @business.save
              flash[:success] = "Business saved."
              redirect_to @business
            else
              flash[:notice] = "Business could not be saved."
              redirect_to new_business_path
            end
          end
        end
      else
        if hash_query.count > 1
          @data = hash_query.map { |result| result.ttxid }
          @business = current_user.build_business
          flash.now[:success] = "We've found more than one result."
          render :new
        else
          @business = current_user.build_business(hash_query.first.to_h)
          if @business.save
            flash[:success] = "Business saved."
            redirect_to @business
          else
            flash[:notice] = "Business could not be saved."
            redirect_to new_business_path
          end
        end
      end
    end
    # rescue
    #   flash[:notice] = "Invalid information."
    #   redirect_to new_business_path
    # end
  end

  def query_result
    @data = params[:query_result]
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

    def hashify_query
      hash = business_params.to_h
      hash_upcase = {}
      hash.each { |k,v| hash_upcase[k] = v.upcase if v != ''}
      hash_upcase
    end

    def stringify_query
      hash_upcase = hashify_query
      string = ""
      hash_upcase.each { |k,v| string += "#{v} " if v != '' }
      string[0..-2]
    end

    def query_selected
      query = { 'ttxid' => params['selected'] }
      query_soda(query)
    end

end
