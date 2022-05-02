# frozen_string_literal: true

class BrokeInLines
  def initialize(sentence, limit)
    @sentence = sentence
    @limit = limit
  end

  def call
    split_in_lines.join("\n").strip
  end

  def split_in_lines
    line_number = 0

    @sentence.split.each_with_object([]) do |word, lines|
      lines[line_number] = '' if lines[line_number].nil?

      unless lines[line_number].length < @limit && (lines[line_number].length + word.length) <= @limit
        lines[line_number].strip!
        line_number += 1
        lines[line_number] = ''
      end

      lines[line_number] += "#{word} "
    end
  end
end
