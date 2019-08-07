# Account model
class AccountGroupingType < ActiveRecord::Base
  # Access restrictions
  attr_accessible :name

  # Scopes
  default_scope order: 'code'

  # Dummy scope to make scoped_by happy
  # scope :by_date, scoped

  # Validation
  validates_presence_of :code, :name

  has_many :accounts

  # String
  def to_s(_format = :default)
    '%s (%s)' % [name, code]

  end

  # String
  def to_select_label
    '(%s) %s' % [code, name]
  end

end
