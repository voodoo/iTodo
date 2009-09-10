class ItemsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def create
    item = current_todo.items.create(:body => params[:body])
    render :partial => 'items/item', :locals => {:item => item}
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
  # actions :index, :show, :new, :edit, :create, :update, :destroy
  # respond_to :html, :js, :xml, :json
  # 
  # protected
    
    # def collection
    #   paginate_options ||= {}
    #   paginate_options[:page] ||= (params[:page] || 1)
    #   paginate_options[:per_page] ||= (params[:per_page] || 20)
    #   @items ||= end_of_association_chain.paginate(paginate_options)
    # end
    #     
end