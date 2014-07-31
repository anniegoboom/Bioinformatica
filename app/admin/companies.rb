ActiveAdmin.register Company do
  index do
    column :name
    default_actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :ticker
      f.input :name,  required: true
      f.input :price
      # f.input :'52_week_high'
      # f.input :'52_week_low'
      f.input :cash
      f.input :shares_out
      f.input :three_month_volume
      f.input :burn
      f.input :runway
      f.input :debt_due
      f.input :programs
      f.input :info_snippets
    end
    f.actions
  end
end
