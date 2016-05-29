class AddLanguagetoSnippets < ActiveRecord::Migration
  def change
    add_reference :snippets, :language,  index: true, foreign_key: true
  end
end
