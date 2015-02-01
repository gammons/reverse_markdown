module ReverseMarkdown
  module Converters
    class EnNote < Base
      def convert(node)
        treat_children(node) << "\n"
      end
    end
    register :"en-note", EnNote.new
  end
end
