class Url < ApplicationRecord
    validates :url, presence: true

    VALID_SHORTCODE_REGEX = /^[0-9a-zA-Z_]{4,}$/
    validates :shortcode, 
        uniqueness: { case_sensitive: true },
        format: { with: VALID_SHORTCODE_REGEX, multiline: true }
end
