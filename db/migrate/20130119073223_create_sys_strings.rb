class CreateSysStrings < ActiveRecord::Migration
  def change
    create_table :sys_strings do |t|

      t.timestamps
    end
  end
end
