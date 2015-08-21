# encoding: UTF-8

module MassiveLoadsHelper
  
  def read_excel
    require "roo"
    file_name = "#{Rails.root}/public#{@massive_load.excel_file.url.gsub(/\?\d+\z/, "")}"
    if file_name =~ /\.xls\z/
      s = Roo::Excel.new(file_name)
    else
      s = Roo::Excelx.new(file_name)
    end
    out = File.open "massive_load_out.txt", "a"
    inc_id = 1

    2.upto(s.last_row) do |line|
      #      begin
      unless @event.attendees.blank?
        inc_id = @event.attendees.last.attendee_id.gsub(@event.token_for_id, "").to_i + 1
      end
      attendee_id = @event.token_for_id + "%04d" % inc_id#s.cell(line, "A")
      #        subgroup_key = s.cell(line, "B")
      #        e_name = s.cell(line, "C")
      e_tradename = s.cell(line, "A")
#      social_reason = s.cell(line, "C")
#      social_reason.try(:strip!)
      #        e_street = s.cell(line, "E")
      #        e_ext_number = s.cell(line, "F")
      #        e_int_number = s.cell(line, "G")
      #        e_colony = s.cell(line, "H")
      #        e_municipality = s.cell(line, "I")
      #        e_city = s.cell(line, "J")
      #        e_state = s.cell(line, "K") 
      #        e_zip_code = s.cell(line, "L")
      #        e_rfc = s.cell(line, "M")
      #        e_lada = s.cell(line, "N")
      #        e_phone = s.cell(line, "O")
      a_name = "#{s.cell(line, "B")} #{s.cell(line, "C")}".strip
#      name = "#{s.cell(line, "A")} #{s.cell(line, "B")}"
#      name.try(:strip!)
      #        a_email = s.cell(line, "Q")
      #        a_chat = s.cell(line, "R")
      #        a_cellphone = s.cell(line, "S")
      #        a_tel_nextel = s.cell(line, "T")
      #        a_radio_nextel = s.cell(line, "U")
      #        a_is_director = s.cell(line, "V")
      #        a_platform = s.cell(line, "W")
      #        e_main_line = s.cell(line, "X")
      #        a_sec_line = s.cell(line, "Y")
      #        a_num_employees = s.cell(line, "Z")
      #        a_other_line = s.cell(line, "AA")
      #        a_web = s.cell(line, "AB")
      #        a_market_segment = s.cell(line, "AC")
      #        a_sector =  s.cell(line, "AD")
      #        a_want_email =  s.cell(line, "AE")
      #        a_job =  s.cell(line, "AF")
      #        e_name = "N/A" if e_name.nil?
      #        e_tradename = "N/A" if e_tradename.nil?
      #        e_street = "N/A" if e_street.nil?
      #        e_ext_number = e_ext_number.to_i.to_s if e_ext_number.is_a? Float
      #        e_ext_number = e_ext_number.gsub(/[a-zA-Z-]/, "") if !e_ext_number.nil?
      #        e_ext_number = 0 if e_ext_number.blank?
      #        e_int_number = e_int_number.to_i.to_s if e_int_number.is_a? Float
      #        e_colony = "N/A" if e_colony.nil?
      #        e_municipality = "N/A" if e_municipality.nil?
      #        e_city = "N/A" if e_city.nil?
      #        e_state = "N/A" if e_state.nil?
      #        e_zip_code = e_zip_code.to_i.to_s if e_zip_code.is_a? Float
      #        e_zip_code = "00000" if e_zip_code.nil?
      #        e_rfc = "N/A" if e_rfc.nil?
      #        e_lada = e_lada.to_i.to_s if e_lada.is_a? Float
      #        e_lada = 0 if e_lada.nil?
      #        e_phone = e_phone.to_i.to_s if e_phone.is_a? Float
      #        e_phone = "N/A" if e_phone.nil?
      #        a_email = "N/A" if a_email.nil?
      #        a_cellphone = a_cellphone.to_i.to_s if a_cellphone.is_a? Float
      #        a_cellphone = "N/A" if a_cellphone.nil?
      #        a_tel_nextel = a_tel_nextel.to_i.to_s if a_tel_nextel.is_a? Float
      #        a_radio_nextel = a_radio_nextel.to_i.to_s if a_radio_nextel.is_a? Float
      #        a_is_director = "NO" if a_is_director.nil?
      #        a_is_director = a_is_director.upcase == "SI"
      #        a_platform = "N/A" if a_platform.nil?
      #        e_main_line = "N/A" if e_main_line.nil?
      #        e_main_line = e_main_line.mb_chars.upcase
      #        e_main_line = e_main_line.to_s
      #        a_sec_line = "N/A" if a_sec_line.nil?
      #        a_sec_line = a_sec_line.mb_chars.upcase
      #        a_sec_line = a_sec_line.to_s
      #        a_num_employees = a_num_employees.to_i.to_s if a_num_employees.is_a? Float
      #        a_num_employees = 0 if a_num_employees.nil?
      #        a_other_line = "N/A" if a_other_line.nil?
      #        a_other_line.mb_chars.upcase!
      #        a_market_segment = "N/A" if a_market_segment.blank?
      #        a_sector= "N/A" if a_sector.nil?
      #        a_want_email = "NO" if a_want_email.nil?
      #        a_want_email = a_want_email.upcase == "SI"
      #        a_job = "N/A" if a_job.nil?
      #        subgroup_id = @event.subgroups.find_by_subgroup_key(subgroup_key).id
      if attendee_id[0, 2] == @event.token_for_id
        @attendee = @event.attendees.new(subgroup_id: 37, e_tradename: e_tradename, e_name: e_tradename, a_name: a_name, attendee_id: attendee_id, active: false)
        if @attendee.save
          #            AttendeeMailer.welcome_email(@attendee).deliver!
        else
          out.puts @attendee.errors.inspect
        end
      end
#      @exhibitor = @event.exhibitors.new(social_reason: social_reason, name: social_reason, contact: name, email: 'email.email.com', exposition_key: 'CLAVE', phone: '0000000')
#      unless @exhibitor.save
#        out.puts @exhibitor.errors.inspect
#      end
      #      rescue
      #        @has_error = true
      #      end
    end
    out.close
  end
  
end
