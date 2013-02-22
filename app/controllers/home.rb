Complimentator.controller do

  get :index do
    if params[:name]
      @name = Name.new(params[:name])
      @words = Word.expand(@name)
    end
    if request.xhr?
      content_type 'application/javascript'
      render '/home/index.js', :layout => false
    else
      render '/home/index.html'
    end
  end

end
