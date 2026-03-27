class AddUserIdToComputeRequests < ActiveRecord::Migration[8.1]
  def change
    add_reference :compute_requests, :user, null: false, foreign_key: true
  end
end
