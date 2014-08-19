module ChatParser
  extend ActiveSupport::Concern

  def initialize
  end

  def parse(str)
    lines = str.rstrip.split(/\r?\n/).map {|line| line.chomp }
    buf = []
    until lines.empty?
      buf.push parse_line(lines.shift)
    end
    buf
  end

  private
  def parse_line(line)
    Obscenity.sanitize(line)
#    line+"test"
  end

end
