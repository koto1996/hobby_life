class SearchesController < ApplicationController
 before_action :authenticate_customer!

 def search
   @content = params[:content]
   @model = params[:model]
   @method = params[:method]
   if @model == 'customer'
      @records = Customer.search_for(@content,@method)
   elsif @model == 'post'
      @records = Post.search_for(@content,@method)
   else
      @records = Hobby.search_for(@content,@method)
   end
 end


end
