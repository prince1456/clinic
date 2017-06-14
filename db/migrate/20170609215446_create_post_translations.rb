class CreatePostTranslations < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      dir.up do
        Post.create_translation_table!({
          :title => :string,
          :content => :text,
          :auther  => :string,
          :picture => :string,
          :video => :string,
          :attachments => :string,
        }, {
          :migrate_data => true
        })
      end
      dir.down do
       Post.drop_translation_table! :migrate_data => true
     end
    end 
  end
end
