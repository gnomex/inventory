class Category < ActiveRecord::Base
  self.table_name = "categories"

  before_validation :normalized_name
  # before_destroy :check_parents

  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :items, dependent: :restrict_with_exception
  has_many :components, dependent: :restrict_with_exception

  default_scope -> { order name: "ASC" }

  protected
  def normalized_name
    self.name = name.humanize
  end
end
