class AddColumnToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :event_title, :string
    add_column :events, :event_description, :string
  end
end
