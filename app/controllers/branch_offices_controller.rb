class BranchOfficesController < ApplicationController
    before_action :find_branch_office, except: [:new, :create, :index]
    
    #GET /branch_offices
    def index
        @branch_offices = BranchOffice.all
    end
    
    #GET /branch_offices/new
    def new
        @branch_office = BranchOffice.new
    end

    #POST /branch_offices
    def create 
        @branch_office = BranchOffice.create(branch_office_params)
        redirect_to @branch_office 
    end

    #GET /branch_offices/{id}
    def show
    end

    #GET /branch_offices/{id}/edit
    def edit
    end

    #PATCH /branch_offices/{id}
    def update
        @branch_office.update(branch_office_params)
        redirect_to @branch_office  
    end

    #DELETE /branch_offices/{id}
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
