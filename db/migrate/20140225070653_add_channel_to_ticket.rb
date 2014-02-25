class AddChannelToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :channel, :string
  end
end
