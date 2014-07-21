class CountryList

  def all
    [
      { name: "United States of America", continent: "North America" },
      { name: "Canada", continent: "North America" },
      { name: "Italy", continent: "Europe" },
      { name: "Venezuela", continent: "South America" },
      { name: "Mexico", continent: "North America" },
      { name: "South Africa", continent: "Africa" },
      { name: "Spain", continent: "Europe" },
      { name: "Colombia", continent: "South America" },
      { name: "France", continent: "Europe" },
      { name: "Kenya", continent: "Africa" },
      { name: "Argentina", continent: "South America" },
    ]
  end

  def continents
    all.map { |country| country[:continent] }.uniq.sort
  end

  def countries_for_continent(continent)
    all.map {|country|
    if country[:continent] == "#{continent}"
      country[:name]
    end
    }
  end

end