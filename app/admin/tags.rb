ActiveAdmin.register Tag do
  form do |f|
    f.inputs "Details" do
      f.input :tag_type, required: true
      f.input :name
      f.input :info_snippets
    end
    f.actions
  end
end
