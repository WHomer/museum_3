require './lib/patron'
require './lib/exhibit'

class Museum
  attr_reader :name,
              :exhibits

  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    results = []
    patron.interests.each do |interest|
      results << @exhibits.find{|exhibit| exhibit.name == interest}
    end
    results
  end
end
