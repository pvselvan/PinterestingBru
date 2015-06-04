class PinsController < ApplicationController
	def create
		@user=current_user
		@board=current_user.boards.find(params[:board_id])
		@pin=@board.pins.new(pins_params)
		@pin.user_id=@user.id
		if @pin.save
			redirect_to user_board_pin_path(current_user,@board.id,@pin.id)
		else
			render 'new'
		end
		
	end

	def show
	
		@board=current_user.boards.find(params[:board_id])
		@pin=@board.pins.find params[:id]
		
	end


	def index
		@board=current_user.boards.find(params[:board_id])
		@pins=@board.pins 
	end

	def edit
		@board=current_user.boards.find(params[:board_id])
		@pin=@board.pins.find params[:id]
	end


	def destroy
		@board=current_user.boards.find(params[:board_id])
		@pin=@board.pins.find params[:id]
		@pin.destroy

		redirect_to user_board_path(current_user,@board.id)
	end

	def new
		@board=current_user.boards.find(params[:board_id])
		@pin=@board.pins.new

	end

	def update 
		@board=current_user.boards.find(params[:board_id])
		@pin=@board.pins.find params[:id]
		if @pin.update(pins_params)
			redirect_to user_board_pin_path(current_user,@board.id,@pin.id)
		else
			render 'edit'
		end

	end


	private
	def pins_params
		params.require(:pin).permit(:title, :description, :url, :likes)
	end

end
