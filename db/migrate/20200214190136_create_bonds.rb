class CreateBonds < ActiveRecord::Migration[5.1]
  def change
    create_table :bonds do |t|
      t.string :name
      t.string :type
      t.decimal :term
      t.decimal :yield

      t.timestamps
    end
  end
end
