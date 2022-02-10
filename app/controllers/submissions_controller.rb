# frozen_string_literal: true

class SubmissionsController < ApplicationController
  before_action :set_submission, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @submissions = Submission.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @submission = current_user.submissions.build
  end

  def edit; end

  def create
    @submission = current_user.submissions.build(submission_params)

    respond_to do |format|
      if @submission.save
        format.html do
          redirect_to submission_url(@submission),
                      notice: 'Submission was successfully created.'
        end
        format.json { render :show, status: :created, location: @submission }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json do
          render json: @submission.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @submission.update(submission_params)
        format.html do
          redirect_to submission_url(@submission),
                      notice: 'Submission was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @submission }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json do
          render json: @submission.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @submission.destroy

    respond_to do |format|
      format.html do
        redirect_to submissions_url,
                    notice: 'Submission was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  def set_submission
    @submission = Submission.find(params[:id])
  end

  def submission_params
    params
      .require(:submission)
      .permit(:title, :body, :url, :submission_image, :submission_video, :community_id)
  end
end
