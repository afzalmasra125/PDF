class ExportsController < ApplicationController 
  require 'unirest'

  def show
    response = Unirest.get("http://localhost:3000/student/1")

    # @resume = Student.find(params[:id])

   response.respond_to do|format|
     format.pdf do
        pdf = ExportPdf.new
        send_data pdf.render,
          filename: "export.pdf",
          type: 'application/pdf',
          disposition: 'inline'
      end
    end
  end 
end  