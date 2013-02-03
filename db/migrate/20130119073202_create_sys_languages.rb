class CreateSysLanguages < ActiveRecord::Migration
  def change
    create_table :sys_languages do |t|
      t.string :name

      t.timestamps
    end
    SysLanguage.create!([
        {:name => "eng"},
        {:name => "chs"}
    ])

  end
end
