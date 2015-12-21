class CodigosController < ApplicationController 
	#before_action :set_codigo, only: [:show, :edit, :update, :destroy]

	def index
		@codigos = Codigo.all
		puts ">>>" + @codigos.length.to_s 
	end

	def show
	end

	def new
		@codigo = Codigo.new
	end

	def create
		@codigo = Codigo.new(codigo_params)
		respond_to do |format|
			if @codigo.save
		        format.html {redirect_to action: :index, notice: 'Codigo creado' } 
	      	else
		        format.html { render :new }
		        format.json { render json: @codigo.errors, status: :unprocessable_entity }
	      	end
		end 
	end
	
	def edit
	end
 
	def update
		
	end

	def destroy
		
	end

	private 
	def set_codigo
		@codigo = Codigo.find(params[:id])
	end

	def codigo_params
      params.require(:codigo).permit(:nombre,:valor,:descripcion)
    end

end