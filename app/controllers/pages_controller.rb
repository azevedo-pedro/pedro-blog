# frozen_string_literal: true

class PagesController < ApplicationController
  def about
    set_meta_tags(
      title: "Sobre mim",
      description: "Conheça Pedro Azevedo, desenvolvedor fullstack apaixonado por Ruby on Rails e frontend."
    )
  end
end
