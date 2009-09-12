class ItemsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def create
    item = current_todo.items.create(:body => params[:body])
    render :partial => 'items/item', :locals => {:item => item}
  end
  def destroy
    current_todo.items.find(params[:id]).destroy
  end
  def update_incomplete
    item = current_todo.items.find(params[:id]) 
    item.update_attribute(:complete, false)   
    render :nothing => true
  end
  def update_complete
    item = current_todo.items.find(params[:id]) 
    item.update_attribute(:complete, true)   
    render :nothing => true
  end  
end