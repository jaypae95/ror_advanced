ActiveAdmin.register Post do
  index do
    selectable_column #checkbox
    id_column
    column :title
    column :body
    column :user
    column :post_likes do |obj| #post
      obj.likes.count
    end
    actions
  end

  filter :title

  form do |f|
    f.input :title
    f.input :body
  end
end
