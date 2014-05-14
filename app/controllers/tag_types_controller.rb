class TagTypesController < ApplicationController

  respond_to :json

  def index
    tag_types = TagTypes.all.map do |t|
      {
        type: t.type,
        id: t.id
      }
    end

    render :json => tag_types
  end
end
