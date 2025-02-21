class AddMediaToAnswers < ActiveRecord::Migration[7.2]
  def change
    add_column :answers, :image, :string
    add_column :answers, :video, :string
  end
end
