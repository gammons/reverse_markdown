require 'spec_helper'

describe ReverseMarkdown::Converters::EnNote do
  let(:converter) { ReverseMarkdown::Converters::EnNote.new }

  it 'just converts into two spaces and a newline' do
    input = node_for("<en-note>test stuff</en-note>")
    expect(converter.convert(input)).to eq "test stuff\n"
  end
end

