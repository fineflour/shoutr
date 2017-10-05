class TextShout < ApplicationRecord
    validates :body, presence: true, length: {in: 1..144}
    searchable do
      text :body

    end
end
