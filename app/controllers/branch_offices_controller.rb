class BranchOfficesController < ApplicationController
    before_action :find_branch_office, except: [:new, :create, :index]
    
    def index
        @branch_offices = BranchOffice.all
    end
    
    def new
        @branch_office = BranchOffice.new
    end

    def create 
        @branch_office = BranchOffice.create(branch_office_params)
        render json: @branch_office
    end

    def show
    end

    def edit
    end

    def update
        @branch_office.update(branch_office_params)
        redirect_to @branch_office  
    end

    def destroy
        @branch_office.destroy
        redirect_to root_path
    end

    def find_branch_office
        @branch_office = BranchOffice.find(params[:id])
    end

    def branch_office_params
        params.require(:branch_office).permit(:name,:direction,:phone)
    end
end
