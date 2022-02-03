# frozen_string_literal: true

class Submission < ApplicationRecord
  mount_uploader :submission_image, SubmissionImageUploader
  mount_uploader :submission_video, SubmissionVideoUploader

  belongs_to :user
  belongs_to :community

  validates :title, presence: true
  validates :url, url: true, allow_blank: true
  validates :body, length: { maximum: 5000 }

  validate :image_or_video

  # validate :text_or_url

  private

  def image_or_video
    return if submission_image.blank? || submission_video.blank?

    errors.add(:base, 'Add an image or video, not both')
  end

  def text_or_url
    return if url.blank? || body.blank?

    errors.add(:base, 'Add a valid URL or text content')
  end
end
