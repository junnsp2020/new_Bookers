class PostImagesController < ApplicationController
   def edit
    @user=User.find(params[:id])
   end
   def new
   	@book_image=BookImage.new
   end
   def create
    @book_image=BookImage.new(book_image_params)
    @book_image.user_id=current_user.id
    if @book_image.save
      redirect_to book_images_path
    else
      render :new
    end
   end

   def index
   	   @book_images=BookImage.page(params[:page]).reverse_order
   end
   def show
   		@book_image=BookImage.find(params[:id])
   		@book_comment=BookComment.new
   end
   def destroy
      @book_image = BookImage.find(params[:id])
      @book_image.destroy
      redirect_to book_images_path
   end

  end
