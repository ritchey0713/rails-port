module PageDefaultsConcern
  extend ActiveSupport::Concern 

  included do 
    before_action :set_page_defaults
  end 

  def set_page_defaults
   @page_title = "RitcheyDev Portfolio"
   @seo_keywords = "Dj Ritchey Portfolio"
  end 
end 