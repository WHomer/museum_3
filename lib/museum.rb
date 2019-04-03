require './lib/patron'
require './lib/exhibit'
require "pry"

class Museum
  attr_reader :name,
              :exhibits,
              :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
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

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    result = {}
    @exhibits.each do |exhibit|
      result[exhibit] = []
    end

    @patrons.each do |patron|
      recommend_exhibits(patron).each do |interst|
        result[interst] << patron
      end
    end
    result
  end

end
