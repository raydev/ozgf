class SysLanguage < ActiveRecord::Base
  attr_accessible :name

  def self.by_sym(sym)
    @@lans ||= {}
    @@lans[sym] ||= SysLanguage.find_by_name(sym.to_s)
  end
end
