class RenameGptReplyToContent < ActiveRecord::Migration[7.0]
  def change
    rename_column(:messages, :gpt_reply, :content)
  end
end
