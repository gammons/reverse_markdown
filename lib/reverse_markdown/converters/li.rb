module ReverseMarkdown
  module Converters
    class Li < Base
      def convert(node)
        content     = treat_children(node)
        indentation = indentation_for(node)
        prefix      = prefix_for(node) unless has_no_text?(node)
        text = "#{indentation}#{prefix}#{content}"
        text << "\n" unless has_no_text?(node)
        text
      end

      def has_no_text?(node)
        node.children[0].text.gsub(/\n/,'').strip == ""
      end

      def prefix_for(node)
        if node.parent.name == 'ol'
          index = node.parent.xpath('li').index(node)
          "#{index.to_i + 1}. "
        else
          '- '
        end
      end

      def indentation_for(node)
        length = node.ancestors('ol').size + node.ancestors('ul').size
        '  ' * [length - 1, 0].max
      end
    end

    register :li, Li.new
  end
end
