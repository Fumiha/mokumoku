# frozen_string_literal: true

class Event < ApplicationRecord
  include Notifiable
  attribute :only_woman, :boolean
  belongs_to :prefecture
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :commented_users, through: :comments, class_name: 'User', source: :user
  has_many :attendances, dependent: :destroy, class_name: 'EventAttendance'
  has_many :attendees, through: :attendances, class_name: 'User', source: :user
  has_many :bookmarks, dependent: :destroy
  has_one_attached :thumbnail

  scope :future, -> { where('held_at > ?', Time.current) }
  scope :past, -> { where('held_at <= ?', Time.current) }
  scope :only_woman, -> { where(only_woman: true) }

  with_options presence: true do
    validates :title
    validates :content
    validates :held_at
  end

  def past?
    held_at < Time.current
  end

  def future?
    !past?
  end

  def woman_only?
    only_woman
  end

  def can_attend?(user)
    return true unless woman_only?
    user&.woman?
  end

  def set_event_only_woman_if_applicable(current_user, event_params)
    # current_userが女性でかつparams[:event][:only_woman]がtrueの場合
    if current_user.woman? && event_params[:only_woman] == "true"
      self.event_only_woman = true
    end
  end
  
end
