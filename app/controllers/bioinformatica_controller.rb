class BioinformaticaController < ApplicationController
  respond_to :html

  def snippets
    info_snippets = InfoSnippet.all
      info_snippets.each do |info|
            puts info.text
      end
  end

  def tags
  end

  # def new
  # end

  # def index
  #   @info_snippets = InfoSnippet.all
  # end

  # def create
  #   @info = InfoSnippet.new(info_params)

  #   @info.save
  #   render :new
  # end

  # def show
  #   @info = InfoSnippet.find(params[:id])
  # end

  # def edit
  #   @info = InfoSnippet.find(params[:id])
  # end

  # def update
  #   @info = InfoSnippet.find(params[:id])

  #   if @info.update_attributes(info_params)
  #     render :show
  #   else
  #     render :edit
  #   end
  # end

  # private

  # def info_params
  #   params.require(:info_snippet).permit(:text)
  # end
end
