class Destination < ActiveRecord::Base
  VALID_SETTINGS = %w(rural urban)

  validates :name, :presence => true
  validate :validate_setting

  private
  def validate_setting
    self.errors[:setting] = "must be one of: #{VALID_SETTINGS.join(', ')}" unless VALID_SETTINGS.include? self.setting
  end
end
