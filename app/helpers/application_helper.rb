module ApplicationHelper

  def all_food_type
    food_types = FoodType.all
  end
  def all_food_preference
    food_preferences = FoodPreference.all
  end
  def all_cuisine
    cuisines = Cuisine.all
  end

end
