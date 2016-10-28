class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  has_many :user_events
  has_many :events, through: :user_events
  has_many :teams, through: :roles, source: :resource, source_type: "Team"

  accepts_nested_attributes_for :roles

  validates :name, :email, presence: true

  def self.from_omniauth(auth, token=nil)
    if token.present?
      user = User.accept_invitation!({
        invitation_token: token,
        name: (auth.info.name if auth.info.name.present?),
        email: (auth.info.email if auth.info.email.present?)
      })
      user.provider = auth.provider
      user.uid = auth.uid
      user.save!
    end
    user || where(auth.slice(:provider, :uid).to_hash).first
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
end
