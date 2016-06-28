class UserToken < ActiveRecord::Base
    validates :user, presence: true
  validates :token, presence: true, uniqueness: {case_sensitive: false}
  validates :installation_identifier, presence: true, uniqueness: {case_sensitive: false, scope: %w(user_id)}
  validates :push_token, allow_blank: true, uniqueness: {case_sensitive: false}
  validates :form_factor, allow_blank: true, inclusion: {in: %w(smartphone tablet10 tablet7 desktop)}
  validates :os, allow_blank: true, inclusion: {in: %w(ios android bb wp7)}

  scope :with_push_token, -> { where.not push_token: nil }

  belongs_to :user, counter_cache: true

  before_validation :set_token

  private

  def set_token
    self.token ||= loop do
      token = Devise.friendly_token.downcase
      break token unless self.class.where(token: token).first.present?
    end
  end
end
