class Proposal
  attr_accessor :game_one, :game_two
  attr_accessor :answers
  def initialize(game_one = nil, game_two = nil)
    @game_one = game_one
    @game_two = game_two
    @answers = []
  end

  def answer(user, answer)
    return false unless able_to_accept?(user)
    return false if answers.any? { |ans| ans.user == user }

    proposal_answer = ProposalAnswer.new(self, user, answer)
    user.proposal_answers.push proposal_answer
    answers.push proposal_answer

    true
  end

  def positive_answers
    answers.select(&:accepted?)
  end

  def ==(other)
    game_one == other.game_one && game_two == other.game_two
  end

  def able_to_accept?(user)
    return true if user.wishes?(game_one) && user.owns?(game_two)
    return true if user.wishes?(game_two) && user.owns?(game_one)

    false
  end
end
