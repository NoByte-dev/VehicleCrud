class AddColumnKindToVehicle < ActiveRecord::Migration[7.0]
  def change
    add_column :vehicles, :kind, :integer
  end
end
