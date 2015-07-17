class Component < ActiveRecord::Base
  self.table_name = "components"

  # before_save :normalize_part_number

  validates_presence_of :name, :stock, :description, :datasheet, :status
  validates_uniqueness_of :name

  validates :stock, numericality: { only_integer: true, greater_than_or_equal_to: 0}

  validate :status_is_a_hash?

  belongs_to :category

  default_scope -> { order created_at: "DESC" }

  protected
  def normalize_part_number
    self.part_number = part_number.strip.upcase!
  end

  def status_is_a_hash?
    unless self.status.instance_of? Hash
      errors.add(:status, I18n.t("flash.components.errors.status.nothash"))
    end
  end
end
