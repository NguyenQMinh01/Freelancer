class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation
  has_many_attached :attachments, dependent: :destroy

  def chat_attachment(index)
    target = attachments[index]
    return unless attachments.attached?

    if target.image?
      target.variant(resize_to_limit: [150, 150]).processed
    elsif target.video?
      target.variant(resize_to_limit: [150, 150]).processed
    elsif target.gif?
      target.variant(resize_to_limit: [150, 150]).processed
    end
  end

end
