class AddStarDateRedirectCountLastSeenDateToUrls < ActiveRecord::Migration[7.0]
  def change
    add_column :urls, :startDate, :datetime
    add_column :urls, :redirectCount, :integer, default: 0
    add_column :urls, :lastSeenDate, :datetime
  end
end
