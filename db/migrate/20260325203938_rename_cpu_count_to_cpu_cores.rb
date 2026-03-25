class RenameCpuCountToCpuCores < ActiveRecord::Migration[8.1]
  def change
    rename_column :compute_requests, :cpu_count, :cpu_cores
  end
end
