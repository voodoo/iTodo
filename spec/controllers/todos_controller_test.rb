require File.dirname(__FILE__) + '/../spec_helper'
 
describe TodosController do
  fixtures :all

  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Todo.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    @todo = Todo.new
    @todo.stub!(:valid?).and_return(false)
    Todo.stub!(:new).and_return(@todo)
    lambda {
      post :create, :todo => {}      
    }.should change(Todo, :count).by(0)
  end
  
  it "create action should redirect when model is valid" do
    @todo = Todo.new
    @todo.stub!(:valid?).and_return(true)
    Todo.stub!(:new).and_return(@todo)
    lambda {
      post :create, :todo => {}      
    }.should change(Todo, :count).by(1)
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Todo.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    put :update, :id => Todo.first, :todo => {}
    response.should redirect_to(todo_url(assigns[:todo]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    lambda {
      delete :destroy, :id => Todo.first
    }.should change(Todo, :count).by(-1)
    response.should redirect_to(todos_url)
  end
end
