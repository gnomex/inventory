class Component < ActiveRecord::Base
  self.table_name = "components"

  before_save :normalize_name

  validates_presence_of :part_number, :stock, :description, :datasheet, :status
  validates_uniqueness_of :part_number

  validate :status_is_a_hash?

  belongs_to :category

  default_scope -> { order created_at: "DESC" }

  protected
  def normalize_name
    self.part_number = part_number.strip.upcase!
  end

  def status_is_a_hash?
    unless self.status.instance_of? Hash
      errors.add(:status, I18n.t("flash.components.errors.status.nothash"))
    end
  end
end
