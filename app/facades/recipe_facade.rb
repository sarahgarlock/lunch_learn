class RecipeFacade
  def get_recipes(country)
    request = service.get_recipes(country)
    request[:hits].map do |data|
      Recipe.new(data, country)
    end
  end

  def service
    RecipeService.new
  end
end