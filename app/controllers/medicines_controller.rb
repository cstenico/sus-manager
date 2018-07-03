class MedicinesController < ApplicationController
     #mostrar lista de unit_cares
    #mostrar unit_care
    #mostrar remedio

    #novo local_storage
    #novo remedio
    #editar available de remedio + ou -
  
    def index
        @medicines = MedicinesCollection.all
    end
  
    def show
      @medicine = MedicinesCollection.by_key params[:id]

    end
  
    def new
      @medicines = Medicine.new
    end
  
    def edit
      @patient.build_personal_information if @patient.personal_information.nil?
    end

    #pinkie = Pony.new(name: "Pinkie Pie")
    #PoniesCollection.save pinkie
    def create
        medicine = Medicine.new(medicine_params)
        MedicinesCollection.save medicine
    
        respond_to do |format|
          format.html { redirect_to medicines_path, notice: 'Medicamento cadastrado' }
      end
    end

    #existing_pony.name = "Applejack"
    #PoniesCollection.save existing_pony

    def update
      respond_to do |format|
        if @patient.update(patient_params)
          format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
          format.json { render :show, status: :ok, location: @patient }
        else
          format.html { render :edit }
          format.json { render json: @patient.errors, status: :unprocessable_entity }
        end
      end
    end
  
    #PoniesCollection.delete existing_pony
    def destroy
      medicine.destroy
      respond_to do |format|
        format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
  
      def medicine_params
        params.require(:medicine).permit(
            :cnpj,
            :razaoSocial,
            :noRegistro,
            :codApresentacao,
            :codBarras,
            :nomeMedicamento,
            :descricao,
            :registroCAS,
            :nomeSubstancia,
            :tipoProduto,
            :vendaHospital,
            :listaCap,
            :listaConfaz,
            :preco,
            :precoTax,
            :available
        )
      end
end
