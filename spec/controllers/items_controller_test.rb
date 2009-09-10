require File.dirname(__FILE__) + '/../spec_helper'
 
describe ItemsController do
  fixtures :all

  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Item.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    @item = Item.new
    @item.stub!(:valid?).and_return(false)
    Item.stub!(:new).and_return(@item)
    lambda {
      post :create, :item => {}      
    }.should change(Item, :count).by(0)
  end
  
  it "create action should redirect when model is valid" do
    @item = Item.new
    @item.stub!(:valid?).and_return(true)
    Item.stub!(:new).and_return(@item)
    lambda {
      post :create, :item => {}      
    }.should change(Item, :count).by(1)
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Item.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    put :update, :id => Item.first, :item => {}
    response.should redirect_to(item_url(assigns[:item]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    lambda {
      delete :destroy, :id => Item.first
    }.should change(Item, :count).by(-1)
    response.should redirect_to(items_url)
  end
end
