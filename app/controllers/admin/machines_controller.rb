class Admin::MachinesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_machine, only: [:edit, :update, :destroy]

  def index
    @machines = Machine.all
    @machine = Machine.new
  end

  def create
    @machine = Machine.new(machine_params)
    if @machine.save
      machine_params[:body_part_ids].each do | machineb |
        body_part = MachineBody.new(body_part_id: machineb)
        body_part.machine_id = @machine.id
        body_part.save
      end
      redirect_to admin_machines_path, notice: 'マシン名を作成しました!'
    else
      flash[:danger] = @machine.errors.full_messages
      redirect_to admin_machines_path
    end
  end

  def edit; end

  def update
    if @machine.update(machine_params)
      redirect_to admin_machines_path, notice: 'マシン名を変更しました!'
    else
      render :edit
    end
  end

  def destroy
    @machine.destroy
    redirect_to admin_machines_path, notice: 'マシン名を削除しました!'
  end

  private

  def machine_params
    params.require(:machine).permit(:name, :machine_image, body_part_ids: [])
  end

  def set_machine
    @machine = Machine.find(params[:id])
  end
end
