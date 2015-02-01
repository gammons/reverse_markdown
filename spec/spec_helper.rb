require 'reverse_markdown'

RSpec.configure do |config|
  config.after(:each) do
    ReverseMarkdown.instance_variable_set(:@config, nil)
  end
end

def node_for(html)
  Nokogiri::XML.parse(html).root
end
