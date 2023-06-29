class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_params, only: %i[show edit update destroy]

  def index
    @venues = Venue.all

    @answer = 'Welcome to EvVen chatbot, type "help" or "assistance" to start'

      if params[:question]
      if params[:question].downcase.match?("hello") || params[:question].downcase.match?("hi")
      @answer = 'hello, how can I help you?'
      return @answer
      elsif params[:question] === ""
      return @answer
      elsif params[:question].downcase.match?("help") || params[:question].downcase.match?("assistance")
      @answer = "To help you I need to understand what do you need, please type one of the following words to give you the proper information:
      -Create an account
      -Add a venue or a club to the web
      -Edit an existing venue or a club in the web
      -Delete a venue or a club from the web
      -Book a venue or a club for an event"
      elsif params[:question].downcase.match?("account") || params[:question].downcase.match?("login")
      @answer = "1. To register go to the navbar on the top of the page and you will find a button saying Sign up as soon as you click on it you will be directed to the sign up page
      2. To Login to an existing account go to the navbar on the top of the page and you will find a button saying Login as soon as you click on it you will be directed to the login page
      In case your questions have been answered and you do not wish to continue chatting type 'quit' otherwise type 'help'"
      return @answer
      elsif params[:question].downcase.match?("create an account")
      @answer = "To register go to the navbar on the top of the page and you will find a button saying Sign up as soon as you click on it you will be directed to the sign up page
      In case your questions have been answered and you do not wish to continue chatting type 'quit' otherwise type 'help'"
      return @answer
      elsif params[:question].downcase.match?("add a venue or a club to the web")
      @answer = 'To add a venue or a club to the website you have to access with your account, then go to the home page and click on the "Add venue" button, by doing that you will be directed
      to the relevant form
      In case your questions have been answered and you do not wish to continue chatting type "quit" otherwise type "help"'
      return @answer
      elsif params[:question].downcase.match?("add")
      @answer = 'To add a venue or a club to the website you have to access with your account, then go to the home page and click on the "Add venue" button, by doing that you will be directed
      to the relevant form
      In case your questions have been answered and you do not wish to continue chatting type "quit" otherwise type "help"'
      return @answer
      elsif params[:question].downcase.match?("book a venue or a club for an event")
      @answer = "To book a venue or a club go to its page and click on the 'Book now!' button on the bottom right corner, then pick the desired dates and click on 'Send booking request, keep in mind that you can always ask the owner any question you might have
      there is a chat you can access by clicking on the 'Chat with owner' button'
      In case your questions have been answered and you do not wish to continue chatting type 'quit' otherwise type 'help'"
      return @answer
      elsif params[:question].downcase.match?("book")
      @answer = "To book a venue or a club go to its page and click on the 'Book now!' button on the bottom right corner, then pick the desired dates and click on 'Send booking request', keep in mind that you can always ask the owner any question you might have
      there is a chat you can access by clicking on the 'Chat with owner' button
      In case your questions have been answered and you do not wish to continue chatting type 'quit' otherwise type 'help'"
      return @answer
      elsif params[:question].downcase === "quit"
      @answer = "Thank you for your time, have a good day."
      return @answer
      elsif params[:question].downcase.match?("edit a venue or a club for an event")
      @answer = 'To edit a venur or club details you must be its owner, if so you will see a pen icon on its profile. Just click on it and you will be automatically directed to the relevant form.
      In case your questions have been answered and you do not wish to continue chatting type "quit" otherwise type "help"'
      return @answer
      elsif params[:question].downcase.match?("edit")
      @answer = 'To edit a venur or club details you must be its owner, if so you will see a pen icon on its profile. Just click on it and you will be automatically directed to the relevant form.
      In case your questions have been answered and you do not wish to continue chatting type "quit" otherwise type "help"'
      return @answer
      elsif params[:question].downcase.match?("delete a venue or a club for an event")
      @answer = 'To delete a venur or club you must be its owner, if so you will see a trashcan/basket icon on its profile. Just click on it and you will be automatically asked to confirm your choice.
      In case your questions have been answered and you do not wish to continue chatting type "quit" otherwise type "help"'
      return @answer
      elsif params[:question].downcase.match?("delete")
      @answer = 'To delete a venur or club you must be its owner, if so you will see a trashcan/basket icon on its profile. Just click on it and you will be automatically asked to confirm your choice.
      In case your questions have been answered and you do not wish to continue chatting type "quit" otherwise type "help"'
      return @answer
      else
      return @answer
      end
    end

  end

  def show
    @booking = Booking.new
    @review =  Review.new
    @reviews = Review.all
  end

  def new
    @venue = Venue.new
  end

  def create
    @user = current_user
    @venue = Venue.new(venue_params)
    @venue.user = @user
    if @venue.save
      redirect_to venue_path(@venue), notice: "Venue created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @venue.update(venue_params)
      redirect_to venue_path(@venue), notice: "Venue updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @venue.destroy
    redirect_to venues_path, notice: "Venue deleted successfully.", status: :see_other
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :location, :description, :price, :availability_dates, :tags, :user_id, :picture, photos: [])
  end

  def set_params
    @venue = Venue.find(params[:id])
  end
end
