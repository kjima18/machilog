class AddCityRefToPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :city, foreign_key: true
  end
end
