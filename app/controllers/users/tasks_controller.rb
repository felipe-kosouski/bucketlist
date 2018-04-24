class Users::TasksController < Users::BaseController
  skip_before_action :verify_authenticity_token, only: [:completed, :uncompleted]
  before_action :load_list

  def create
    @task = @list.tasks.new(task_parms)

    if @task.save
      flash[:success] = "Tarefa criada com sucesso!"
    else
      flash[:error] = "Não foi possível criar a tarefa"
    end

    redirect_to users_list_path(@list)
  end

  def completed
    @task = @list.tasks.find(params[:id])
    @task.mark_as_completed
  end

  def uncompleted
    @task = @list.tasks.find(params[:id])
    @task.mark_as_uncompleted
  end

  private
  def load_list
    @list = current_user.lists.find_by(id: params[:list_id]) ||
        current_user.shared_lists.find(params[:list_id])
  end

  def task_parms
    params.require(:task).permit(:title)
  end

end