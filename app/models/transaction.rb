class Transaction < ApplicationRecord
  belongs_to :user

  def given
    Game.new given_game_id
  end

  def given=(game)
    self.given_game_id = game.id
  end

  def received
    Game.new received_game_id
  end

  def received=(game)
    self.received_game_id = game.id
  end

  def execute
    return false if executed?
    user.wishlist.delete(received)
    user.ownlist.delete(given)
    user.ownlist.push received
    user.exchanges.push self
  end

  private

  def executed?
    self.persisted?
  end
end
