class AddMediaToQuestions < ActiveRecord::Migration[7.2]
  def change
    add_column :questions, :image, :string
    add_column :questions, :video, :string
  end
end
