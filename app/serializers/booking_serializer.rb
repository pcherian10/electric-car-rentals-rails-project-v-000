class BookingSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :end_date, :car, :rating
  belongs_to :user
  belongs_to :car

end
