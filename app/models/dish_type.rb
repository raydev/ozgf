class DishType < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name_sys_string
  belongs_to :name_sys_string, :class_name => "SysString", :foreign_key => "name_sys_string_id"
  
  has_many :dishes
  has_many :name_sys_language_strings, :class_name => "SysLanguageString", :source => :sys_language_strings, :through => :name_sys_string 
  
  scope :by_eng_name, lambda{|name| {
      :include => :name_sys_language_strings,
      :conditions => ["LOWER(sys_language_strings.string)=?", name.downcase]
    }}
   
  def self.by_sym(sym)
    @@types ||= {}
    @@types[sym] ||= DishType.by_eng_name(sym.to_s.gsub('_', ' ')).first
  end
end