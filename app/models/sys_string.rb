class SysString < ActiveRecord::Base
  attr_accessible :sys_language_strings
  
  has_many :sys_language_strings
  
  def self.create_by_lans_strings(lans_strings)
    ss = SysString.new
    lans_strings.each_pair do |key, value|
      ss.sys_language_strings <<
        SysLanguageString.create!(
        :sys_language => SysLanguage.by_sym(key),
        :string => value)
    end
    ss.save!
    ss
  end

  def string_by_language_sym(sym)
    lan = SysLanguage.by_sym(sym) || SysLanguage.by_sym(:eng)
    self.sys_language_strings.find(
      :first, 
      :conditions => ["sys_language_strings.sys_language_id=?",
        lan.id])
  end
  
end
