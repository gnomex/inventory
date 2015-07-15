class Component < ActiveRecord::Base
  self.table_name = "components"

  before_save :normalize_name

  validates_presence_of :part_number, :stock, :description, :datasheet, :status
  validates_uniqueness_of :part_number

  belongs_to :category

  default_scope -> { order created_at: "DESC" }

  protected
  def normalize_name
    self.part_number = part_number.strip.upcase!
  end
end
