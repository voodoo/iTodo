class TodosController < ApplicationController
  def index
    todo = Todo.create!(:ip => request.remote_ip, :agent => request.user_agent)
    redirect_to todo_path(todo.token)
  end
  def show   
    #TODO why is show getting called on ajax?
    # if params[:id] == "POST"
    #   # TODO
    #   # Wha?
    #   logger.warn("Why is #show getting called with 'POST' as an id?")
    #   render :nothing => true
    #   return
    # end
    
    @todo = Todo.find_by_token(params[:id])
    session[:todo] = @todo.id
    

  end
     
end