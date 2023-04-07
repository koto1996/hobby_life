class Customer::HobbiesController < ApplicationController

 def index
   @hobby = Hobby.new
   @hobbies = current_customer.hobbies.all
 end


 def create
   @hobby = Hobby.new(hobby_params)
   @hobby.customer_id=current_customer.id
  if
   @hobby.save
   redirect_to hobbies_path
  else
   render request.referer
  end
 end

  def edit
   @hobby = Hobby.find(params[:id])
  end

 def update
   @hobby = Hobby.find(params[:id])
  if
   @hobby.customer_id==current_customer.id
   @hobby.update(hobby_params)
   redirect_to hobbies_path
  end
 end

 private

 def hobby_params
   params.require(:hobby).permit(:name,:customer_id)
 end
end
