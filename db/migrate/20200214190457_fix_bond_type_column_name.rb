class FixBondTypeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :bonds, :type, :bond_type
  end
end
