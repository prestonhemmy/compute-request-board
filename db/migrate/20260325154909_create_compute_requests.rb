class CreateComputeRequests < ActiveRecord::Migration[8.1]
  def change
    create_table :compute_requests do |t|
      t.string :title
      t.integer :gpu_count
      t.integer :cpu_count
      t.integer :memory_gb
      t.integer :hours
      t.string :partition
      t.string :priority
      t.string :status
      t.text :notes

      t.timestamps
    end
  end
end
