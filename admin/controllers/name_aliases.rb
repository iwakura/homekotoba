Admin.controllers :name_aliases do

  get :index do
    @name_aliases = NameAlias.all
    render 'name_aliases/index'
  end

  get :new do
    @name_alias = NameAlias.new
    render 'name_aliases/new'
  end

  post :create do
    @name_alias = NameAlias.new(params[:name_alias])
    if (@name_alias.save rescue false)
      flash[:notice] = 'NameAlias was successfully created.'
      redirect url(:name_aliases, :edit, :id => @name_alias.id)
    else
      render 'name_aliases/new'
    end
  end

  get :edit, :with => :id do
    @name_alias = NameAlias[params[:id]]
    render 'name_aliases/edit'
  end

  put :update, :with => :id do
    @name_alias = NameAlias[params[:id]]
    if @name_alias.modified! && @name_alias.update(params[:name_alias])
      flash[:notice] = 'NameAlias was successfully updated.'
      redirect url(:name_aliases, :edit, :id => @name_alias.id)
    else
      render 'name_aliases/edit'
    end
  end

  delete :destroy, :with => :id do
    name_alias = NameAlias[params[:id]]
    if name_alias.destroy
      flash[:notice] = 'NameAlias was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy NameAlias!'
    end
    redirect url(:name_aliases, :index)
  end
end
