ActiveAdmin.register Program do
  form do |f|
    f.inputs "Details" do
      f.input :name,  required: true
      f.input :description
      f.input :tags
      f.input :info_snippets
    end
    f.actions
  end
end
