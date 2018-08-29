class AddUsersProjectsToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :user, foreign_key: true
    add_reference :comments, :project, foreign_key: true
  end
end