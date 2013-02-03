class SysLanguageString < ActiveRecord::Base
  attr_accessible :string, :sys_language, :sys_string

  belongs_to :sys_language
  belongs_to :sys_string
end
