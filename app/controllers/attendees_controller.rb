# encoding: utf-8

class AttendeesController < ApplicationController
  before_filter :authenticate_user!, :except => [:register, :register_attendee, :confirm, :get_subgroups]
  before_filter :load_event, :only => [:create, :generate_gafete, :print_gafete_a, :print_gafete_b, :print_gafete_c, :attend]
  load_and_authorize_resource :except => [:register, :register_attendee, :get_subgroups, :confirm]

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
    
    respond_to do |format|
      if @attendee.save
        AttendeeMailer.welcome_email(@attendee).deliver!
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
  
  def get_attendee_by_name
    @attendee = Attendee.where(:a_name => params[:a_name].upcase).select([:id, :attendee_id, :e_name, :a_email, :e_phone]).first
    
    render json: @attendee
  end
  
  def get_all_attendee_names
    @attendees = Attendee.where(:event_id => session[:current_event_id]).uniq.pluck(:a_name)
    
    render json: @attendees
  end
  
  def generate_qr
    @qr_value = params[:qr_value]
    
    respond_to do |format|
      format.html
      format.svg  { render :qrcode => @qr_value, :level => :l, :unit => 10, :offset => 50 }
      format.png  { render :qrcode => @qr_value, :offset => 50 }
      format.gif  { render :qrcode => @qr_value, :offset => 50 }
      format.jpeg { render :qrcode => @qr_value, :offset => 50 }
    end
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
    @is_exhibitor = params[:is_exhibitor] == "true"
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
    @is_exhibitor = params[:is_exhibitor] == "true"
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
    if params[:attendee][:event_id].nil?
      respond_to do |format|
        format.html { render action: "register", layout: "registration_form" }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    else
      @event = Event.find_by_id(params[:attendee][:event_id])
      params[:attendee][:attendee_id] = @event.token_for_id.upcase + Array.new(4){[*'0'..'9'].sample}.join
      while !@event.attendees.find_by_attendee_id(params[:attendee][:attendee_id]).nil?
        params[:attendee][:attendee_id] = @event.token_for_id.upcase + Array.new(4){[*'0'..'9'].sample}.join
      end
      params[:attendee][:a_platform] = params[:attendee][:a_platform].join(";") unless params[:attendee][:a_platform].nil?
      params[:attendee][:a_market_segment] = params[:attendee][:a_market_segment].join(";") unless params[:attendee][:a_market_segment].nil?
      @attendee = Attendee.new(params[:attendee])
      @attendee.confirmation_token = Array.new(10) {[*'0'..'9', *'a'..'z'].sample}.join

      respond_to do |format|
        if @attendee.save
          AttendeeMailer.welcome_email(@attendee).deliver!
          format.html { redirect_to "/register", notice: t(:successfully_created) }
          format.json { render json: @attendee, status: :created, location: @attendee }
        else
          format.html { render action: "register", layout: "registration_form" }
          format.json { render json: @attendee.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  
  def get_subgroups
    @subgroups = Subgroup.where(:event_id => params[:event_id]).select([:id, :name])
    render json: @subgroups
  end
  
  def confirm
    @attendee = Attendee.find_by_id(params[:id])
    unless @attendee.nil?
      I18n.locale = @attendee.event.language
      if !@attendee.confirmed && @attendee.confirmation_token == params[:confirmation_token]
        @attendee.update_attribute("confirmed", true)
        flash[:alert] = t("atten.confirmation.confirmed")
      elsif @attendee.confirmed && @attendee.confirmation_token == params[:confirmation_token]
        flash[:notice] = t("atten.confirmation.already_confirmed")
      else
        flash[:error] = t("atten.confirmation.wrong")
      end
    end
    render layout: "devise"
  end
  
  def select_email_type
  end
  
  def send_mails
    require "rake"
    
    if %w{welcome acknowledgment invitation general}.include?(params["email_type"])
      Rake::Task.clear
      Expomobile::Application.load_tasks
      Rake::Task["mails:#{params["email_type"]}_email"].reenable
      begin
        Rake::Task["mails:#{params["email_type"]}_email"].invoke(params[:event_id])
        flash[:success] = t("mail_template.emails_sent")
      rescue
        flash[:error] = t("mail_template.something_went_wrong")
      end
    else
      flash[:error] = t("mail_template.must_select")
    end
    redirect_to attendees_select_email_type_path
  end
  
  def attend
    @attendee = Attendee.find_by_id(params[:attendee_id])
    if params[:attend] == "true"
      @attendee.update_attributes(attended: true, attended_date: Time.now.in_time_zone(@event.time_zone).time)
    elsif params[:attend] == "false"
      @attendee.update_attributes(attended: false)
    end
    render nothing: true
  end
  
  def load_event
    @event = Event.find_by_id(session[:current_event_id])
  end
  
end