class ExportsController < ApplicationController 
  def show
    @student = Unirest.get("http://soc-resumes-api.herokuapp.com/students/2").body

    respond_to do|format|
      format.pdf do
        pdf = ExportPdf.new(@student)

        send_data pdf.render,
                  filename: "export.pdf",
                  type: 'application/pdf',
                  disposition: 'inline'
      end
    end
  end 
end  