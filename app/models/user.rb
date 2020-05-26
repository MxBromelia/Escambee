class User
  attr_accessor :name
  attr_accessor :ownlist, :wishlist
  attr_accessor :proposal_answers, :match_answers
  attr_accessor :exchanges

  def initialize
    @proposal_answers = []
    @match_answers = []
    @ownlist = Ownlist.new self
    @wishlist = Wishlist.new self
    @exchanges = []
  end

  def wishes?(game)
    wishlist.include? game
  end

  def proposals(proposals)
    proposals.select { |proposal| proposal.able_to_accept? self }
  end

  def matches(matches)
    matches.select { |match| match.users.include? self }
  end

  def owns?(game)
    ownlist.include? game
  end

  def exchange(proposal)
    return unless accepted?(proposal)

    answer(proposal).transaction.execute
  end

  def answer(request)
    proposal_answer(request) || match_answer(request)
  end

  def accepted?(proposal)
    answer(proposal)&.accepted?
  end

  def ==(other)
    name == other.name
  end

  private

  def proposal_answer(proposal)
    return false unless proposal.is_a? Proposal

    proposal_answers.find { |answer| answer.proposal == proposal }
  end

  def match_answer(match)
    match_answers.find { |answer| answer.match == match }
  end
end
