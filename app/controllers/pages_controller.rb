class PagesController < ApplicationController
  def salut
    @name = params[:name] || "non-saisie"
  end

  def home
  end
end