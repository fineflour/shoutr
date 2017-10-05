class Search
  attr_reader :term
  def initialize(term:)
    @term = term
  end

  def run
#    binding.pry
    #ShoutSearchQuery.new(term: "#{term}").to_relation
    Sunspot.search([TextShout, PhotoShout]) { fulltext term }.results
  end

  def to_partial_path
    "search/search"
  end


  alias results run
end
