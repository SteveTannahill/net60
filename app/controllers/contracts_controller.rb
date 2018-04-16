class ContractsController < ApplicationController
  include PodioHelper
  def listing_agreement
    podio_init
    get_item
    
  end
end
