class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_submission
  before_action :set_comment, only: %i[edit update destroy]

  def new
    @comment = @submission.comments.build
  end

  # rubocop:disable Metrics/AbcSize
  def create
    @comment = @submission.comments.build(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to submission_path(@submission), notice: 'Comment was successfully created.' }
        format.js
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { redirect_to submission_path(@submission), alert: 'Your comment did not save. Please try again' }
        format.js
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  # rubocop:enable Metrics/AbcSize

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to submission_path(@submission), notice: 'Comment was successfully updated' }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    redirect_to submission_path(@submission)
  end

  private

  def set_submission
    @submission = Submission.find(params[:submission_id])
  end

  def set_comment
    @comment = @submission.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:reply, :submission_id)
  end
end
