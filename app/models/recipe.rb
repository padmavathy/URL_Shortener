class Recipe < ActiveRecord::Base
  DIFFICULTY=%w(Easy Medium Hard)
  belongs_to :food_type
  belongs_to :food_preference
  belongs_to :cuisine

  def self.search(search)
    fp = FoodPreference.find_by_name(search)
    ft = FoodType.find_by_name(search)
    cuisine = Cuisine.find_by_name(search)
    fp.nil? ? ft.nil? ? cuisine.nil? ? a = 0 : a = cuisine : a = ft : a= fp
    if !fp.nil?
      Recipe.where("food_preference_id = ?", fp.id)
    elsif !ft.nil?
      Recipe.where("food_type_id = ?", ft.id)
    else
      Recipe.where("cuisine_id = ?", cuisine.id)
    end
  end
end
