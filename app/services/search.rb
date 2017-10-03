class Search
  attr_reader :term
  def initialize(term:)
    @term = term
  end

  def run
    ShoutSearchQuery.new(term: "##{term}").to_relation
  end

  alias results run
end
