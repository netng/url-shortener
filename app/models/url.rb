class Url < ApplicationRecord
    validates :url, presence: true

    VALID_SHORTCODE_REGEX = /^[0-9a-zA-Z_]{4,}$/
    validates :shortcode, 
        presence: true,
        uniqueness: { case_sensitive: true },
        length: { minimum: 4 },
        format: { with: VALID_SHORTCODE_REGEX, multiline: true }
end
