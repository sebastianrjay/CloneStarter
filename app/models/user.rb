class User < ActiveRecord::Base

  attr_reader :password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\z/i
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :password_digest, :session_token, presence: true

  before_validation :ensure_session_token

  has_many(:started_projects,
    class_name: 'Project',
    foreign_key: :starter_id,
    primary_key: :id
  )

  has_many(:comments,
    class_name: 'Comment',
    foreign_key: :commenter_id,
    primary_key: :id
  )

  has_many(:pledges,
    class_name: 'Pledge',
    foreign_key: :pledger_id,
    primary_key: :id
  )

  has_many :pledged_projects, through: :pledges, source: :project

  def as_json(options = {})
    { id: self.id, username: self.username }.merge(options)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return nil unless user && user.valid_password?(password)
    user
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def valid_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
  end

  private

    def ensure_session_token
      self.session_token ||= SecureRandom.urlsafe_base64
    end
end
