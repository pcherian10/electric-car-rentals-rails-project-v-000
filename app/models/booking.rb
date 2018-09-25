class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car

=begin
  def categories_attributes=(categories_hashes)
   categories_hashes.each do |i,category_attributes|
     category = Category.find_or_create_by(name: category_attributes[:name])
     self.post_categories.build(:category => category)
   end
 end
=end


end
