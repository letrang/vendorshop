class Product < ActiveRecord::Base
   has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  belongs_to :category
  has_many :line_items

  scope :products_new, ->{order('created_at desc').limit(20)}
  scope :products_price, -> { where('price < ?', 3000).limit(8)}

  searchable do
    text :name, :description
  end
end
