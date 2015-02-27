json.array!(@orders) do |order|
  json.extract! order, :id, :total_price, :is_payed, :date, :zip_code, :city, :street, :number, :user_id
  json.url order_url(order, format: :json)
end
