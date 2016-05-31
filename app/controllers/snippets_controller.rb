class SnippetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_snippet, only: [:show, :edit, :update, :destroy]

  # GET /snippets
  # GET /snippets.json
  def index
    if params[:query] && params[:query].present?
      @snippets = Snippet.search(params[:query]).records
    else
      @snippets = Snippet.latest
    end
  end

  # GET /snippets/1
  # GET /snippets/1.json
  def show
    @comments = @snippet.comments
  end

  # GET /snippets/new
  def new
    @snippet = Snippet.new
  end

  # GET /snippets/1/edit
  def edit
  end

  # POST /snippets
  # POST /snippets.json
  def create
    @snippet = Snippet.new(snippet_params)
    @snippet.user = current_user

    respond_to do |format|
      if @snippet.save
        format.html { redirect_to @snippet, notice: 'Snippet was successfully created.' }
        format.json { render :show, status: :created, location: @snippet }
      else
        format.html { render :new }
        format.json { render json: @snippet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /snippets/1
  # PATCH/PUT /snippets/1.json
  def update
    respond_to do |format|
      if @snippet.update(snippet_params)
        format.html { redirect_to @snippet, notice: 'Snippet was successfully updated.' }
        format.json { render :show, status: :ok, location: @snippet }
      else
        format.html { render :edit }
        format.json { render json: @snippet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /snippets/1
  # DELETE /snippets/1.json
  def destroy
    if @snippet.user == current_user
      @snippet.destroy
      respond_to do |format|
        format.html { redirect_to snippets_url, notice: 'Snippet was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to snippets_url, alert: 'Only author may destroy a snippet' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_snippet
      @snippet = Snippet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def snippet_params
      params.require(:snippet).permit(:title, :code, :language_id)
    end
end
