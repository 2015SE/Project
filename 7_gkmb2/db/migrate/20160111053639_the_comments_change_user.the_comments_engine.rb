

class TheCommentsChangeUser < ActiveRecord::Migration
  def change
    #if you User class is not called User, you may want to change it.
    change_table :users do |t|
      # "Written by me" (cache counters)
      t.integer :my_draft_comments_count,      default: 0
      t.integer :my_published_comments_count,  default: 0
      t.integer :my_comments_count,            default: 0 # my_draft_comments_count + my_published_comments_count

      # commentable's comments => comcoms (cache counters)
      # Relation through Comment#holder_id field
      t.integer :draft_comcoms_count,     default: 0
      t.integer :published_comcoms_count, default: 0
      t.integer :deleted_comcoms_count,   default: 0
      t.integer :spam_comcoms_count,      default: 0
    end
  end
end