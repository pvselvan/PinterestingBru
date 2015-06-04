class BoardsController < ApplicationController
	def index
		@users=User.all 
		@boards=current_user.boards
		@boards_public=[]
		@boards_private=[]

		@users.each do |user|
			@user=user
			@boards_from_other_user=user.boards
			@boards_from_other_user.each do |board_from_other|
				if(board_from_other.public==true)
					@boards_public<<board_from_other
				end
			end

		end

		
		@boards.each do |board|
			
			if board.public==true 
				unless @boards_public.include?(board)
					@boards_public<<board
				end
			else
				@boards_private<<board
			end 
		end

	end

	def create
		@user=current_user
		@board=@user.boards.new(board_params)
		@board.user_id=current_user.id 

		if @board.save
			redirect_to user_board_path(@user.id,@board.id)
		else
			render 'new'
		end

	end

	def show
		@board = Board.find params[:id]

		if !@board.public? && @board.user != current_user
			redirect_to :root, alert: "You cannot access that board"
		end
		@pins=@board.pins
	end



	def edit
		@board=current_user.boards.find params[:id]
	end



	def new
		@board=current_user.boards.new
	end



	def update
		@board=current_user.boards.find params[:id]
		if @board.update(board_params)
			redirect_to user_board_path(current_user, @board.id)
		else
			render 'edit'
		end
	end

	def destroy
		@board=current_user.boards.find params[:id]
		@board.destroy 

		redirect_to user_boards_path(current_user)
	end

	private
	def board_params
		params.require(:board).permit(:name, :description, :public)
		end
	
end
