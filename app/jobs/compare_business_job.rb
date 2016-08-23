class CompareBusinessJob < ApplicationJob
  queue_as :default

  def perform(ttxid)
    prep_soda
    query = query_soda('ttxid' => ttxid.to_s)
    business = Business.find_by_ttxid(ttxid)
    # if !business.compare(query.first)
      UserMailer.warn(business.user).deliver!
    # end
  end

  private

    def prep_soda
      @client = SODA::Client.new({domain: 'data.sfgov.org',app_token: Rails.application.secrets.socrata_api_key})
    end

    def query_soda(qparams)
      @client.get(Rails.application.secrets.data_set_id,qparams)
    end

end
