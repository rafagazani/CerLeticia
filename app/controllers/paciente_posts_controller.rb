class PacientePostsController < ApplicationController
  before_action :set_paciente_post, only: [:show, :edit, :update, :destroy]

  # GET /paciente_posts
  # GET /paciente_posts.json
  def index
    @paciente_posts = PacientePost.all
  end

  # GET /paciente_posts/1
  # GET /paciente_posts/1.json
  def show
  end

  # GET /paciente_posts/new
  def new
    @paciente_post = PacientePost.new
  end

  # GET /paciente_posts/1/edit
  def edit
  end

  # POST /paciente_posts
  # POST /paciente_posts.json
  def create
    @paciente_post = PacientePost.new(paciente_post_params)

    respond_to do |format|
      if @paciente_post.save
        format.html { redirect_to @paciente_post, notice: 'Paciente post was successfully created.' }
        format.json { render :show, status: :created, location: @paciente_post }
      else
        format.html { render :new }
        format.json { render json: @paciente_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paciente_posts/1
  # PATCH/PUT /paciente_posts/1.json
  def update
    respond_to do |format|
      if @paciente_post.update(paciente_post_params)
        format.html { redirect_to @paciente_post, notice: 'Paciente post was successfully updated.' }
        format.json { render :show, status: :ok, location: @paciente_post }
      else
        format.html { render :edit }
        format.json { render json: @paciente_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paciente_posts/1
  # DELETE /paciente_posts/1.json
  def destroy
    @paciente_post.destroy
    respond_to do |format|
      format.html { redirect_to paciente_posts_url, notice: 'Paciente post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paciente_post
      @paciente_post = PacientePost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paciente_post_params
      params.require(:paciente_post).permit(:id_paciente, :id_post, :visualizacoes)
    end
end
