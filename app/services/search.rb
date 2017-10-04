class Search
  attr_reader :term
  def initialize(term:)
    @term = term
  end

  def results
#    binding.pry
    ShoutSearchQuery.new(term: "#{term}").to_relation
  end

  def to_partial_path
    "search/search"
  end


  #alias results run
end
