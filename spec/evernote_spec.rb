require 'spec_helper'

describe "Evernote" do
  it "does things" do
    file = File.read("./spec/test.html")
    f = File.open("out.md","w")
    f << ReverseMarkdown.convert(file, unknown_tags: :drop, github_flavored: true)
  end
end

