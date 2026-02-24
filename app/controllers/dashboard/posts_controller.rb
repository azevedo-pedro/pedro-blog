# frozen_string_literal: true

module Dashboard
  class PostsController < BaseController
    before_action :set_post, only: [ :show, :edit, :update, :destroy ]

    def index
      @posts = Post.order(published_at: :desc)
    end

    def show
    end

    def new
      @post = Post.new(published_at: Time.current, published: true)
    end

    def create
      @post = Post.new(post_params)
      if @post.save
        redirect_to dashboard_post_path(@post), notice: "Post criado com sucesso."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @post.update(post_params)
        redirect_to dashboard_post_path(@post), notice: "Post atualizado com sucesso."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @post.destroy
      redirect_to dashboard_posts_path, notice: "Post excluído com sucesso."
    end

    private

    def set_post
      @post = Post.friendly.find(params[:id])
    end

    def post_params
      params.require(:post).permit(
        :title, :description, :body, :published_at, :category,
        :background_color, :thumbnail_url, :thumbnail_image, :published
      )
    end
  end
end
