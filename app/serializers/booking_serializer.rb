class BookingSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :end_date, :car
end
