class PacientesController < ApplicationController
  include ActiveModel::AttributeMethods
  before_action :set_paciente, only: [:show, :edit, :update, :destroy]

  # GET /pacientes
  # GET /pacientes.json
  def index
    @pacientes = Paciente.all
    
  end

  # GET /pacientes/1
  # GET /pacientes/1.json
  def show

   #@imagens = Post.skip(rand(Post.count)).limit(3)
   
   # se existir parametro :obj na url ele puxa o objeto com id da url
   if(params.has_key?(:obj))
      @post = Post.find_by(_id: params[:obj])
   else
    #senao ele puxa um objeto aleatorio que possua menor visualizacao pelo paciente da url
      todosPosts = Post.all
      todosPacientePosts = PacientePost.all

      menor = 99999999;  #numero gigante, reclame com a Rigolon!    
      @variavel = menor;
      todosPosts.each do |imagem|
        begin
          qtd = PacientePost.find_by({id_post: imagem._id}).visualizacoes;
          
          if(PacientePost.find_by({id_post: imagem._id}).count == 1)
            @post = Post.skip(rand(Post.count)).first
        end
        rescue
          qtd = 0;
          @post = Post.skip(rand(Post.count)).first
        end
        if(qtd < menor)
          menor = qtd;
          @variavel = qtd;
          @post = imagem;
        end 
      end 

      #@post = Post.skip(rand(Post.count)).first para post totalmente aleatorio
    end

   #lista de imagens aleatorias embaixo da principal, limite de 3 por vez
   @imagens = (0..Post.count-1).sort_by{rand}.slice(0, 3).collect! do |i| Post.skip(i).first end

    #verifica se o objeto ja foi visto uma vez e incrementa 1 visualizaçao na qtd total, senao gera um novo item na docuemnto PacientePost com 1 visualizacao
    begin
      @pacientepost = PacientePost.find_by({id_paciente: params[:id], id_post: @post._id});
      @pacientepost.id_paciente = params[:id]
      @pacientepost.id_post = @post._id;
      soma = @pacientepost.visualizacoes+1
      @pacientepost.visualizacoes = soma
      @pacientepost.save
    rescue
      @variavel = @post
      @pacientepost = PacientePost.new(id_paciente: params[:id], id_post: @post._id, visualizacoes: 1)
      @pacientepost.save
    end

  end

  # GET /pacientes/new
  def new
    @paciente = Paciente.new
  end

  # GET /pacientes/1/edit
  def edit
  end

  # POST /pacientes
  # POST /pacientes.json
  def create
    @paciente = Paciente.new(paciente_params)

    respond_to do |format|
      if @paciente.save
        format.html { redirect_to @paciente, notice: 'Paciente was successfully created.' }
        format.json { render :show, status: :created, location: @paciente }
      else
        format.html { render :new }
        format.json { render json: @paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pacientes/1
  # PATCH/PUT /pacientes/1.json
  def update
    respond_to do |format|
      if @paciente.update(paciente_params)
        format.html { redirect_to @paciente, notice: 'Paciente was successfully updated.' }
        format.json { render :show, status: :ok, location: @paciente }
      else
        format.html { render :edit }
        format.json { render json: @paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pacientes/1
  # DELETE /pacientes/1.json
  def destroy
    @paciente.destroy
    respond_to do |format|
      format.html { redirect_to pacientes_url, notice: 'Paciente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paciente
      @paciente = Paciente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paciente_params
      params.require(:paciente).permit(:nome, :data_nascimento, :sexo, :image)
    end
end
