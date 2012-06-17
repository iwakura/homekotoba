Complimentator.controller do

  get :index do
    if params[:name]
      @words = Word.expand(params[:name])
    end
    render '/home/index'
  end

end
