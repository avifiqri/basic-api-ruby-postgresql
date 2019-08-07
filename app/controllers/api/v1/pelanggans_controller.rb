module Api
    module V1
        class PelanggansController < ApplicationController

            def index 
                pelanggans = Pelanggan.all
                render json: {status: 'succes', messages: 'loadded pelanggans', data: pelanggans}, status: :ok
            end
            
            def show
                pelanggans = Pelanggan.find(params[:id])
                render json: {status: 'succes', messages: 'loadded show pelanggans', data: pelanggans}, status: :ok
            end

            def create
                pelanggans = Pelanggan.new(pelanggan_params)

                if pelanggans.save
                    render json: {status: 'succes', messages: 'created pelanggan', data: pelanggans}, status: :ok
                else
                    render json: {status: 'error', messages: 'not save', data: pelanggans}, status: :unprocessable_entity
                end
            end

            def destroy
                pelanggans= Pelanggan.find(params[:id])
                pelanggans.destroy
                render json: {status: 'succes', messages: 'destroy pelanggan', data: pelanggans}, status: :o    
            end

            def update
                pelanggans= Pelanggan.find(params[:id])
                if pelanggans.update_attributes(pelanggan_params)
                    render json: {status: 'succes', messages: 'update pelanggan', data: pelanggans}, status: :o    

                else
                    render json: {status: 'error', messages: 'not update save', data: pelanggans}, status: :unprocessable_entity

                    
                end

                
            end

            private
            def pelanggan_params
                params.permit(:name, :jenis, :count, :price, :total )
            end
            
        end
    end
end