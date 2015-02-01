require 'spec_helper'

describe ReverseMarkdown::Converters::EnTodo do
  let(:converter) { ReverseMarkdown::Converters::EnTodo.new }

  context "unchecked" do
    it "makes a list item with an unchecked box" do
      input = node_for("<en-todo />")
      expect(converter.convert(input)).to eq "[ ]"
    end
  end
  context "checked" do
    it "makes a list item with a checked box" do
      input = node_for('<en-todo checked="true" />')
      expect(converter.convert(input)).to eq "[x]"
    end
  end
end


