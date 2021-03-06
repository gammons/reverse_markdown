require 'digest'
require 'nokogiri'
require 'reverse_markdown/version'
require 'reverse_markdown/errors'
require 'reverse_markdown/cleaner'
require 'reverse_markdown/config'
require 'reverse_markdown/converters'
require 'reverse_markdown/converters/base'
require 'reverse_markdown/converters/a'
require 'reverse_markdown/converters/blockquote'
require 'reverse_markdown/converters/br'
require 'reverse_markdown/converters/bypass'
require 'reverse_markdown/converters/code'
require 'reverse_markdown/converters/del'
require 'reverse_markdown/converters/div'
require 'reverse_markdown/converters/drop'
require 'reverse_markdown/converters/em'
require 'reverse_markdown/converters/en_note'
require 'reverse_markdown/converters/en_todo'
require 'reverse_markdown/converters/h'
require 'reverse_markdown/converters/hr'
require 'reverse_markdown/converters/ignore'
require 'reverse_markdown/converters/img'
require 'reverse_markdown/converters/li'
require 'reverse_markdown/converters/ol'
require 'reverse_markdown/converters/p'
require 'reverse_markdown/converters/pass_through'
require 'reverse_markdown/converters/pre'
require 'reverse_markdown/converters/strong'
require 'reverse_markdown/converters/table'
require 'reverse_markdown/converters/td'
require 'reverse_markdown/converters/text'
require 'reverse_markdown/converters/tr'

module ReverseMarkdown

  def self.convert(input, options = {})
    root = case input
      when String                  then Nokogiri::HTML(input).root
      when Nokogiri::XML::Document then input.root
      when Nokogiri::XML::Node     then input
    end

    root or return ''

    result = config.with(options) do
      ReverseMarkdown::Converters.lookup(root.name).convert(root)
    end
    cleaner.tidy(result)
  end

  def self.config
    @config ||= Config.new
    yield @config if block_given?
    @config
  end

  def self.cleaner
    @cleaner ||= Cleaner.new
  end

end
