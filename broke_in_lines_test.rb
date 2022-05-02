# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'broke_in_lines'

class BrokeInLinesTest < Minitest::Test
  def setup
    @broker = BrokeInLines.new(
      'In 1991, while studying computer science at University of Helsinki, Linus Torvalds began a '\
      'project that later became the Linux kernel. He wrote the program specifically for the '\
      'hardware he was using and independent of an operating system because he wanted to use the '\
      'functions of his new PC with an 80386 processor. Development was done on MINIX using the '\
      'GNU C Compiler.',
      40
    )
  end

  def test_broker
    assert_equal(
      "In 1991, while studying computer science\n"\
      "at University of Helsinki, Linus\n"\
      "Torvalds began a project that later\n"\
      "became the Linux kernel. He wrote the\n"\
      "program specifically for the hardware he\n"\
      "was using and independent of an\n"\
      "operating system because he wanted to\n"\
      "use the functions of his new PC with an\n"\
      "80386 processor. Development was done on\n"\
      'MINIX using the GNU C Compiler.', @broker.call
    )
  end
end
