class Admin::BodyPartsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_body_part, only: [:edit, :update, :destroy]

  def index
    @body_parts = BodyPart.all
    @body_part = BodyPart.new
  end

  def create
    @body_part = BodyPart.new(body_part_params)
    if @body_part.save
      redirect_to admin_body_parts_path, notice: '部位名を作成しました!'
    else
      flash[:danger] = @area.errors.full_messages
      redirect_to admin_body_parts_path
    end
  end

  def edit; end

  def update
    if @body_part.update(body_part_params)
      redirect_to admin_body_parts_path, notice: '部位名を変更しました!'
    else
      render :edit
    end
  end

  def destroy
    @body_part.destroy
    redirect_to admin_body_parts_path, notice: '部位名を削除しました!'
  end

  private

  def body_part_params
    params.require(:body_part).permit(:name)
  end

  def set_body_part
    @body_part = BodyPart.find(params[:id])
  end
end
