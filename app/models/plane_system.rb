class PlaneSystem < System

  private
  def new_dice
    Dice.new
  end

  def include_parser(room)
    room.class_eval do
      include ChatParser
    end
  end
end
