class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250}
    validates :summary, length: { maximum: 250}
    validates :category, inclusion: { in: %w( Fiction Non-Fiction)}
    validate :must_be_clickbait

    def must_be_clickbait
        unless title.present? && title.include?("Won't Believe" || "Secret" || "Top [\d]" || "Guess")
            errors.add(:title, "Your title won't get any clicks!")
        end
    end

end

