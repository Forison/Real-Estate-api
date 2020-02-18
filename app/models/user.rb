class User < ApplicationRecord
  before_save {self.picture = parse_image(picture)}
  has_attached_file :picture, styles: {medium: "300x300>",thumb: "100x100"}
  has_many :houses
  attr_accessor :image_base
  acts_as_token_authenticatable
  before_save { self.email = email.downcase }
  validates :username, presence:true, length:{maximum:20}
  validates_attachment :picture, presence: true
  do_not_validate_attachment_file_type :picture
  validates :country, presence:true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 5 }
    validates :password_confirmation , presence:true, length: { minimum:5 }
   
    private 
    def parse_image(arg)
      image = Paperclip.io_adapters.for(arg)
      image.original_filename ='file.jpg'
      self.picture = image 
    end
end
