require 'byebug'
module ReverseMarkdown
  module Converters
    class EnTodo < Base
      def convert(node)
        if node.attributes["checked"] && node.attributes["checked"].value == "true"
          "[x]"
        else
          "[ ]"
        end
      end
    end
    register :"en-todo", EnTodo.new
  end
end

