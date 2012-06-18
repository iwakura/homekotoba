Complimentator.controller do

  get :index do
    if params[:name]
      @words = Word.expand(params[:name])
    end
    Padrino.logger.info( (request.methods - Object.methods).inspect)
    Padrino.logger.info request.preferred_type
    if request.xhr?
      content_type 'application/javascript'
      render '/home/index.js', :layout => false
    else
      render '/home/index.html'
    end

  end

end
