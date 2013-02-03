class CreateSysLanguageStrings < ActiveRecord::Migration
  def change
    create_table :sys_language_strings do |t|
      t.string :string
      t.integer :sys_language_id
      t.integer :sys_string_id

      t.timestamps
    end
  end
end
