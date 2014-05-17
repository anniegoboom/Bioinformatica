ActiveAdmin.register InfoSnippet do
  form do |f|
    f.inputs "Details" do
      f.input :text
      f.input :tags
    end
    f.actions
  end
end
