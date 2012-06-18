Complimentator.controller do

  get :index do
    if params[:name]
      @words = Word.expand(params[:name])
    end
    if request.xhr?
      content_type 'application/javascript'
      render '/home/index.js', :layout => false
    else
      render '/home/index.html'
    end

  end

end
