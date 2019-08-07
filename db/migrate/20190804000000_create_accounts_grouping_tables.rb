class CreateAccountsGroupingTables < ActiveRecord::Migration
  def self.up
    create_table 'account_grouping_types' do |t|
      t.string 'name', limit: 100
      t.string 'code'
      t.datetime 'created_at'
      t.datetime 'updated_at'
    end

    change_table :accounts do |t|
      t.integer :account_grouping_type_id # relation to new table above
    end

    add_index 'accounts', ['account_grouping_type_id'], name: 'index_accounts_on_account_grouping_type_id'
  end

  def self.down
    remove_index 'accounts', name: 'index_accounts_on_account_grouping_type_id'
    remove_column :accounts, :account_grouping_type_id
    drop_table :account_grouping_types
  end
end
