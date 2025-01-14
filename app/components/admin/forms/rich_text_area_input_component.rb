module Admin
  module Forms
    class RichTextAreaInputComponent < BaseComponent
      private attr_reader :cols, :rows

      def initialize(form, field, classes:, cols: nil, rows: nil)
        super(form, field, classes:)
        @cols = cols
        @rows = rows
      end

      def call
        form.rich_text_area(field, data: {controller: "trix-toolbar-post"}, class: classes, cols:, rows:)
      end
    end
  end
end
