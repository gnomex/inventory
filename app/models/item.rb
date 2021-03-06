class Item < ActiveRecord::Base
  self.table_name = "items"

  before_save :normalize_name

  validates_presence_of :name, :quantity
  validates_uniqueness_of :name

  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0}

  belongs_to :category
  belongs_to :toolbox

  default_scope -> { order created_at: "DESC" }

  protected
  def normalize_name
    self.name = name.camelize
  end
end
