class JobsController < ApplicationController
  def index
    if params[:sort] == "location"
      @jobs = Job.order(city: :asc)
    elsif params[:sort] == "interest"
      @jobs = Job.order(level_of_interest: :desc)
    else
      @jobs = Job.all
    end
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    @job.category_id = params[:job][:category_id]
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @job = Job.find(params[:id])
    @comments = @job.comments
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def update
    company = Company.find(params[:company_id])
    job = Job.find(params[:id])
    job.update(job_params)
    redirect_to company_job_path(company, job)
  end

  def destroy
    company = Company.find(params[:company_id])
    job = Job.find(params[:id])
    job.destroy
    redirect_to company_jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city)
  end

end
