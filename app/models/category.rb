class Category < ActiveRecord::Base
  self.table_name = "categories"

  before_validation :normalized_name

  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :items       #, dependent: :destroy
  has_many :components  #, dependent: :destroy

  default_scope -> { order name: "ASC" }

  protected
  def normalized_name
    self.name = name.humanize
  end
end
