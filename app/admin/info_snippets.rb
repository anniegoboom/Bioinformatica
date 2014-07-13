ActiveAdmin.register InfoSnippet do
  index do
    column :subject
    column :text
    default_actions
  end

  show do
  end

  form do |f|
    f.inputs "Details" do
      f.input :subject
      f.input :text
      f.input :tags
      f.input :companies
    end
    f.actions
  end
end
