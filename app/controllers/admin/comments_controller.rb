class Admin::CommentsController < ApplicationController
  layout 'admin'
  before_action :require_login
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /admin/comments
  # GET /admin/comments.json
  def index
    @comments = Comment.order(created_at: :desc).page(page).per(20)
  end

  # GET /admin/comments/1
  # GET /admin/comments/1.json
  def show
  end

  # GET /admin/comments/new
  def new
    @comment = Comment.new
  end

  # GET /admin/comments/1/edit
  def edit
  end

  # POST /admin/comments
  # POST /admin/comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/comments/1
  # PATCH/PUT /admin/comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/comments/1
  # DELETE /admin/comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to admin_comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.fetch(:comment, {})
    end
    
    def page
      params[:page] || 1
    end
end
