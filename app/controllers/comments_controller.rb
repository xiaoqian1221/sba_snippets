class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_snippet
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /snippets/1/comments
  # GET snippets/1/comments.json
  def index
    @comments = @snippet.comments
  end

  # GET /snippets/1/comments/1
  # GET /snippets/1/comments/1.json
  def show
  end

  # GET /snippets/1/comments/new
  def new
    @comment = @snippet.comments.build
  end

  # GET /snippets/1/comments/1/edit
  def edit
  end

  # POST /snippets/1/comments
  # POST /snippets/1/comments.json
  def create
    @comment = @snippet.comments.build(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        Resque.enqueue(MailSender, @comment.id)
        format.html { redirect_to @comment.snippet, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render @comment.snippet }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /snippets/1/comments/1
  # PATCH/PUT /snippets/1/comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment.snippet, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render @comment.snippet }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /snippets/1/comments/1
  # DELETE /snippets/1/comments/1.json
  def destroy
    @comment.destroy if @comment.user == current_user
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_snippet
      @snippet = Snippet.find(params[:snippet_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = @snippet.comments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:snippet_id, :text)
    end
end
