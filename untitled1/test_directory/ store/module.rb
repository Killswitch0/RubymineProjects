module FilmInstVar
  def arr_to_save
    [@title, @genre, @year, @director, @price, @amount]
  end
end

module BookInstVer
  def arr_to_save
    [@name, @genre, @year, @author, @price, @amount]
  end
end