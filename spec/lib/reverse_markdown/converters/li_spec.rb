require 'spec_helper'

describe ReverseMarkdown::Converters::Li do

  let(:converter) { ReverseMarkdown::Converters::Li.new }

  it 'does not fail without a valid parent context' do
    input = node_for("<li>foo</li>")
    result = converter.convert(input)
    expect(result).to eq "- foo\n"
  end


  it 'does not print a dash for ul elements' do
    input = node_for """
    <ul>
    <li>outer bar</li>
    </ul>
    """
    expected = "- outer bar\n"
    expect(converter.convert(input)).to eql(expected)
  end

  it 'does not print a dash if the next line has a nested list' do
    input = node_for """
    <ul>
    <li>outer bar</li>
    <li>
      <ul>
        <li>inner bar 1</li>
        <li>inner bar 2</li>
      </ul>
    </li>
    </ul>
    """

    # - outer bar
    #   - inner bar 1
    #   - inner bar 2
    #
    expected = "- outer bar\n\n  - inner bar 1\n  - inner bar 2\n"
    expect(converter.convert(input)).to eql(expected)
  end
end
