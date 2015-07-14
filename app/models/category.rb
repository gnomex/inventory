class Category < ActiveRecord::Base
  self.table_name = "categories"

  before_validation :normalize_name

  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :items,      dependent: :destroy
  has_many :components, dependent: :destroy

  default_scope -> { order created_at: "DESC" }

  protected
  def normalize_name
    self.part_number = part_number.strip.downcase!
  end
end
