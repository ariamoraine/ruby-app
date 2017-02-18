class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    Job.create(job_params)
    redirect_to jobs_url
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    j = Job.find(params[:id])
    j.update(job_params)
    redirect_to jobs_url
  end

  def destroy
    j = Job.find(params[:id])
    j.destroy
    redirect_to jobs_url
  end

  private

  def job_params
    params.require(:job).permit(:title, :description)
  end
end
