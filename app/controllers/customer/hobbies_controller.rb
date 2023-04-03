class Customer::HobbiesController < ApplicationController

 def index
   @hobby = Hobby.new
   @hobbies = Hobby.all
 end


 def create
   @hobby = Hobby.new(hobby_params)
   @hobby.customer_id=current_customer.id
  if
   @hobby.save
   redirect_to customer_hobbies_path
  else
   render request.referer
  end
 end

 def edit
 end

 def update
 end

 private

 def hobby_params
   params.require(:hobby).permit(:name)
 end
end
