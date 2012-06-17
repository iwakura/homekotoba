Admin.controllers :adjectives do

  get :index do
    @adjectives = Adjective.all
    render 'adjectives/index'
  end

  get :new do
    @adjective = Adjective.new
    render 'adjectives/new'
  end

  post :create do
    @adjective = Adjective.new(params[:adjective])
    if (@adjective.save rescue false)
      flash[:notice] = 'Adjective was successfully created.'
      redirect url(:adjectives, :edit, :id => @adjective.id)
    else
      render 'adjectives/new'
    end
  end

  get :edit, :with => :id do
    @adjective = Adjective[params[:id]]
    render 'adjectives/edit'
  end

  put :update, :with => :id do
    @adjective = Adjective[params[:id]]
    if @adjective.modified! && @adjective.update(params[:adjective])
      flash[:notice] = 'Adjective was successfully updated.'
      redirect url(:adjectives, :edit, :id => @adjective.id)
    else
      render 'adjectives/edit'
    end
  end

  delete :destroy, :with => :id do
    adjective = Adjective[params[:id]]
    if adjective.destroy
      flash[:notice] = 'Adjective was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Adjective!'
    end
    redirect url(:adjectives, :index)
  end
end
