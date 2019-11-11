class Song < ApplicationRecord
  belongs_to :author, class_name: 'Person'
end
