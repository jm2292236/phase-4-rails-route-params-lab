class StudentsController < ApplicationController

    def index
        students = if params.keys.count > 2
            # by default, params have two keys: controller and action
            # having 3 means there's a query in the path
            # Student.search_name(params[params.keys[0]])
            Student.scope_by_name(params[params.keys[0]])
        else
            students = Student.all
        end

        render json: students
    end

    def one_student
        student = Student.find(params[:id])
        render json: student
    end

end
