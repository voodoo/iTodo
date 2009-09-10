class TodosController < ApplicationController
  def index
    todo = Todo.create!
    redirect_to todo_path(todo.token)
  end
  def show   
    @todo = Todo.find_by_token(params[:id])
    session[:todo] = @todo.id
    
    #TODO why is show getting called on ajax?
    
    # rescue
    #   render :nothing => true
  end
  # def create
  # end
  # actions :index, :show, :new, :edit, :create, :update, :destroy
  # respond_to :html, :js, :xml, :json
  # 
  # protected
  #   
  #   def collection
  #     #paginate_options ||= {}
  #     #paginate_options[:page] ||= (params[:page] || 1)
  #     #paginate_options[:per_page] ||= (params[:per_page] || 20)
  #     @items ||= @todo.items #end_of_association_chain.items#paginate(paginate_options)
  #   end
  #   def resource
  #     @todo ||= end_of_association_chain.find_by_token(params[:id])
  #   end       
end