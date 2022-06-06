class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      post_params[:machine_ids].each do | postm |
        machine = MachineType.new(machine_id: postm)
        machine.post_id = @post.id
        machine.save
      end
      redirect_to admin_post_path(@post), notice: 'スポットを投稿完了しました!'
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
        machine_all = MachineType.where(post_id: @post.id)
        machine_all.each do |old_machine|
          old_machine.destroy
        end
        unless post_params[:machine_ids] == nil
          post_params[:machine_ids].each do | postm |
            machine = MachineType.new(machine_id: postm)
            machine.post_id = @post.id
            machine.save
          end
        end
      redirect_to admin_post_path(@post), notice: 'スポット投稿を変更しました!'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path, notice: 'スポット投稿を削除しました!'
  end

  private

  def post_params
    params.require(:post).permit(
      :name,
      :introduction,
      :postal_code, :address, :longitude, :latitude,
      :area_id,
      :post_image,
      :opening_hour,
      :access,
      :phone_number,
      machine_ids: []
      )
  end
end
