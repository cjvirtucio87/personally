class BusinessesController < ApplicationController
  before_action :prep_soda

  def index
    qparams = { '$q' => 'EASTMAN', '$limit' => '3' }
    data = query_soda(qparams)
    raise
  end

end
