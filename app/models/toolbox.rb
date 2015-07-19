class Toolbox < ActiveRecord::Base
  self.table_name = "toolboxes"

  before_save :normalize_name

  validates_presence_of :name, :location

  has_many :items
  has_many :components

  default_scope -> { order created_at: "DESC" }

  protected
  def normalize_name
    self.name = name.camelize
  end
end
