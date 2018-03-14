class ExportPdf  
  include Prawn::View
  attr_reader :first_name, :last_name
  attr_writer :active

  def initialize(student)
    @first_name = student["first_name"]
    @last_name = student["last_name"]
    @short_bio =  student["short_bio"]
    @email = student["email"]
    @phone_number = student["phone_number"]
    @experience = student["experience"]
  
    # experience
    # education
    # social_media

    build_document
  end

  def full_name
    text "#{first_name} #{last_name}", :align => :left, :size => 36, :color => "000099" 
  end

  def contact
    text "#{@email}", :align => :left, :size => 14
    text "#{@phone_number}", :align => :left, :size => 14
    stroke do
       move_down 12
       horizontal_rule
       move_down 12
   end 
  end

  def short_bio
  text "Summary", :style => :bold
   text "#{short_bio}", :align => :left
     # stroke do
     #   move_down 12
     #   horizontal_rule
     #   move_down 5
     # end 
   end 


  def experience
    @experience.each do|experience|

   formatted_text_box [{:text => "#{experience["company_name"]}", :size => 16,:align => :left},
                       {:text => "                                                    #{experience["job_title"]}", :size => 16,:align => :right},
                       {:text => "                   #{experience["start_date"]}"  "#{experience["end_date"]}" , :size => 8, :align => :left}],
                       :at =>[10, 480], :width => 480, :height => 50
  
  end 

    def build_document
    full_name
    contact
    short_bio
    experience
  end
end 

#   # def education 
#   # end

#   def social_media
#     move_down 200
#   text "www.linkedin.com" 
#   text "www.github.com"
#   end
# end 

  
