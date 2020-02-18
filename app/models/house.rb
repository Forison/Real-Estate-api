class House < ApplicationRecord
  before_save {self.images = parse_images(images)}
  belongs_to :user
  has_many :images, dependent: :destroy
  validates :name, presence:true
  validates :category, presence:true
  validates :description, presence:true
  validates :price, presence:true
  validates :location, presence:true
  private
  def parse_images(args)
    new_images=[]
    args.each do |img|
      dec_image = Paperclip.io_adapters.for(img)
      new_images.push(dec_image)
    end
    new_images
  end
end
