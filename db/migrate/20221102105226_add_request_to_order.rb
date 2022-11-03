class AddRequestToOrder < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :request, null: true, foreign_key: true
  end
end
