# encoding: utf-8

class AttendeesController < ApplicationController
  before_filter :authenticate_user!, :except => [:register, :register_attendee, :confirm]
  before_filter :load_event, :only => [:create, :generate_gafete, :print_gafete_a, :print_gafete_b, :print_gafete_c]
  load_and_authorize_resource :except => [:register, :register_attendee]

  def index
    if params[:search].blank?
      @attendees = Attendee.where(:event_id => session[:current_event_id]).order('id DESC').paginate(:per_page => 10, :page => params[:page])
    else
      @attendees = Attendee.where("event_id = #{session[:current_event_id]} AND a_name LIKE '%#{params[:search]}%'").order('id DESC').paginate(:per_page => 10, :page => params[:page])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attendees }
    end
  end

  # GET /attendees/1
  # GET /attendees/1.json
  def show
    @attendee = Attendee.find(params[:id])
    if @attendee.event_id != session[:current_event_id].to_i
      flash[:error] = t(:not_correspond)
      redirect_to attendees_path and return
    end
    @workshops = Workshop.joins("INNER JOIN attendee_workshops a ON workshops.id = a.workshop_id")
    .joins("INNER JOIN attendees at ON a.attendee_id = at.id")
    .where("at.id = ?", @attendee.id)
    @expositions = Exposition.joins("INNER JOIN attendee_expositions a ON expositions.id = a.exhibitor_id")
    .joins("INNER JOIN attendees at ON a.attendee_id = at.id")
    .where("at.id = ?", @attendee.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attendee }
    end
  end

  # GET /attendees/new
  # GET /attendees/new.json
  def new
    @attendee = Attendee.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attendee }
    end
  end

  # GET /attendees/1/edit
  def edit
    @attendee = Attendee.find(params[:id])
    if @attendee.event_id != session[:current_event_id].to_i
      flash[:error] = t(:not_correspond)
      redirect_to attendees_path and return
    end
  end

  # POST /attendees
  # POST /attendees.json
  def create
    @last_attendee = Attendee.last
    inc_id = 1
    unless @last_attendee.nil?
      inc_id = @last_attendee.attendee_id[2..-1].to_i + 1
    end
    params[:attendee][:attendee_id] = @event.token_for_id + "%04d" % inc_id
    params[:attendee][:a_platform] = params[:attendee][:a_platform].join(";") unless params[:attendee][:a_platform].nil?
    params[:attendee][:a_market_segment] = params[:attendee][:a_market_segment].join(";") unless params[:attendee][:a_market_segment].nil?
    params[:attendee][:confirmation_token] = Array.new(10) {[*'0'..'9', *'a'..'z'].sample}.join
    @attendee = Attendee.new(params[:attendee])
    AttendeeMailer.welcome_email(@attendee).deliver!
    
    respond_to do |format|
      if @attendee.save
        format.html { redirect_to @attendee, notice: t(:successfully_created) }
        format.json { render json: @attendee, status: :created, location: @attendee }
      else
        format.html { render action: "new" }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attendees/1
  # PUT /attendees/1.json
  def update
    @attendee = Attendee.find(params[:id])
    params[:attendee][:a_platform] = (params[:attendee][:a_platform] & ["Blackberry", "IPhone", "Android"]) if params[:other_platform].nil?
    params[:attendee][:a_platform] = params[:attendee][:a_platform].join(";") unless params[:attendee][:a_platform].nil?
    params[:attendee][:a_market_segment] = (params[:attendee][:a_market_segment] & ["Gobierno", "Corporativo", "PyMEs", "Educación", "Salud", "Retail", "Web"]) if params[:other_market].nil?
    params[:attendee][:a_market_segment] = params[:attendee][:a_market_segment].join(";") unless params[:attendee][:a_market_segment].nil?
    
    respond_to do |format|
      if @attendee.update_attributes(params[:attendee])
        format.html { redirect_to @attendee, notice: t(:successfully_updated) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendees/1
  # DELETE /attendees/1.json
  def destroy
    @attendee = Attendee.find(params[:id])
    @attendee.destroy

    respond_to do |format|
      format.html { redirect_to attendees_url }
      format.json { head :no_content }
    end
  end
  
  def get_id

    if params[:attendee_id] =~ /^[A-Z]\d{3}$/
      @attendee = @event.attendees.find_by_attendee_id(params[:attendee_id])
      
      if !@attendee.nil?
        @attendee_id = @attendee.id
        @event_id = @event.id
        @nip = @event.nips.find_by_attendee_id(@attendee_id)
      
        while @nip.nil?
          random_value = Array.new(4){[*'0'..'9', *'a'..'z'].sample}.join
          @exists = @event.nips.find_by_nip(random_value)
        
          if @exists.nil?
            @nip = Nip.create(:nip => random_value, :attendee_id => @attendee_id, :event_id => @event_id)
          end
        end
      
        @times_sent = (@nip.times_sent.nil?) ? 0: @nip.times_sent
      
        if @times_sent < 10
          @can_send_email = false
          @can_send_email = ((Time.now - @nip.sent) >= 0) unless @nip.sent.nil?
      
          if @nip.sent.nil? || @can_send_email
            @email = @attendee.a_email
            @domain = @email.gsub(/@.*$/, "")
    
            
            if !@attendee.email.nil?
              
              if AttendeeMailer.send_nip(@attendee, @nip).deliver!
                @nip.update_attributes(:sent => Time.now, :times_sent => (@nip.times_sent.nil?) ? 1: @nip.times_sent += 1 )
                @msg = { email: @email, domain: @domain, msg: t("atten.nip_sended", :email => @email), sent: "ok" }
              else
                @msg = { email: @email, domain: @domain, msg: t("errors.atten_email_dont_sended"), sent: "no" }
              end
            
            else
              @msg = { email: @email, domain: @domain, msg: t("errors.atten_email_not_registered"), sent: "no" }
            end
      
          else
            @msg = { email: @email, domain: @domain, msg: t("errors.atten_email_already_sended"), sent: "no" }
          end
        
        else
          @msg = { email: @email, domain: @domain, msg: t("errors.atten_email_maximum_sends"), sent: "no" }
        end
    
      else
        @msg = { email: nil, domain: nil, msg: t("errors.atten_not_exists"), sent: "no" }
      end
      
    else
      @msg = { email: nil, domain: nil, msg: t("errors.atten_invalid_id"), sent: "no" }
    end
    
    respond_to do |format|
      format.json { render json: @msg }
    end
  end
  
  def get_nip
    
    if params[:attendee_id] =~ /^[A-Z]\d{3}$/
      @attendee = @event.attendees.find_by_attendee_id(params[:attendee_id])
      
      if !@attendee.nil?
        @attendee_id = @attendee.id
        if params[:nip] =~ /^[0-9a-z]{4}$/
          @nip = @attendee.nip
          @email = @attendee.a_email
      
          if params[:nip] == @nip.nip
            @msg = { access: "ok", email: @email, msg: t("atten.access_ok") }
            session[:attendee_id] = @attendee_id
          else
            @msg = { access: "no", email: @email, msg: t("errors.atten_nips_dont_match") }
          end
      
        else
          @msg = { access: "no", email: @email, msg: t("errors.atten_invalid_nip") }
        end
      
      else
        @msg = { email: nil, domain: nil, msg: t("errors.atten_not_exists"), sent: "no" }
      end
      
    else
      @msg = { access: "no", email: @email, msg: t("errors.atten_invalid_id") }
    end

    respond_to do |format|
      format.json { render json: @msg }
    end
  end
  
  def get_attendee
    @attendee = Attendee.where(:attendee_id => params[:attendee_id].upcase).select([:id, :a_name, :e_name, :a_email, :e_phone]).first
    
    render json: @attendee
  end
  
  def get_attendee_by_name
    @attendee = Attendee.where(:a_name => params[:a_name].upcase).select([:id, :attendee_id, :e_name, :a_email, :e_phone]).first
    
    render json: @attendee
  end
  
  def get_all_attendee_names
    @attendees = Attendee.where(:event_id => session[:current_event_id]).uniq.pluck(:a_name)
    
    render json: @attendees
  end
  
  def generate_gafete
    @attendee_id = params[:attendee_id]
    @a_name = params[:a_name]
    @conferences = Conference.order(:start_date).limit(5)
    @diaries = Diary.order(:event_date).limit(5)
    @e_tradename = params[:e_tradename]
    @e_phone = params[:e_phone]
    @a_email = params[:a_email]
    @e_address = params[:e_address]
    @a_web = params[:a_web]
    @event = Event.find_by_id(session[:current_event_id])
  end
  
  def print_gafete_a
    @a_name = params[:a_name]
    @e_tradename = params[:e_tradename]
    @e_phone = params[:e_phone]
    @a_email = params[:a_email]
    @e_address = params[:e_address]
    @a_web = params[:a_web]
    @with_logos = params[:with_logos]
    @with_qr_code = params[:with_qr_code]
    @event = Event.find_by_id(session[:current_event_id])
    render layout: false
  end
  
  def print_gafete_b
    @offset = params[:offset]
    @conferences = Conference.order(:start_date).limit(5).offset(@offset)
    @with_logos = params[:with_logos]
    @event = Event.find_by_id(session[:current_event_id])
    render layout: false
  end
  
  def print_gafete_c
    @offset = params[:offset]
    @diaries = Diary.order(:event_date).limit(5).offset(@offset)
    @with_logos = params[:with_logos]
    @event = Event.find_by_id(session[:current_event_id])
    render layout: false
  end
  
  def register
    @attendee = Attendee.new
    render layout: "registration_form"
  end
  
  def register_attendee
    unless params[:attendee][:e_city].blank?
      params[:attendee][:attendee_id] = (params[:attendee][:e_city][0].upcase + Array.new(2){[*'0'..'9'].sample}.join + ["0", "2", "4", "6", "8"].sample)
      while !@event.attendees.find_by_attendee_id(params[:attendee][:attendee_id]).nil?
        params[:attendee][:attendee_id] = (params[:attendee][:e_city][0].upcase + Array.new(2){[*'0'..'9'].sample}.join + ["0", "2", "4", "6", "8"].sample)
      end
    end
    params[:attendee][:a_platform] = params[:attendee][:a_platform].join(";") unless params[:attendee][:a_platform].nil?
    params[:attendee][:a_market_segment] = params[:attendee][:a_market_segment].join(";") unless params[:attendee][:a_market_segment].nil?
    @attendee = Attendee.new(params[:attendee])

    respond_to do |format|
      if @attendee.save
        AttendeeMailer.send_attendee_id(@attendee, params[:attendee][:attendee_id]).deliver!
        format.html { redirect_to "/register", notice: t(:successfully_created) }
        format.json { render json: @attendee, status: :created, location: @attendee }
      else
        format.html { render action: "register", layout: "register_attendee" }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def get_subgroups
    @subgroups = Subgroup.where(:event_id => params[:event_id]).select([:id, :name])
    render json: @subgroups
  end
  
  def confirm
    @attendee = Attendee.find_by_id(params[:id])
    I18n.locale = @attendee.event.language
    if !@attendee.confirmed && @attendee.confirmation_token == params[:confirmation_token]
      @attendee.update_attribute("confirmed", true)
      flash[:alert] = t("atten.confirmation.confirmed")
    elsif @attendee.confirmed && @attendee.confirmation_token == params[:confirmation_token]
      flash[:notice] = t("atten.confirmation.already_confirmed")
    else
      flash[:error] = t("atten.confirmation.wrong")
    end
    render layout: "devise"
  end
  
  def load_event
    @event = Event.find_by_id(session[:current_event_id])
  end
  
end