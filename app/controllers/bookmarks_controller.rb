class BookmarksController < ApplicationController
  # From ApplicationController
  skip_before_action :correct_user
  skip_before_action :has_business?
  before_action :correct_user_bookmark, only: [:destroy]

  def create
    @bookmark = current_user.bookmarks.create!(bookmark_params)
    flash[:success] = "You've bookmarked this business."
    redirect_to :back
  end

  def destroy
    bookmark = Bookmark.find(params[:id])
    bookmark.destroy
    flash[:success] = "Business unbookmarked."
    redirect_to :back
  end

  private

    def bookmark_params
      params.require(:bookmark).permit(:ttxid)
    end

    def correct_user_bookmark
      bookmark = Bookmark.find(params[:id])
      if bookmark.user_id != current_user.id
        flash[:info] = "You are not authorized to delete that bookmark."
        redirect_to current_user.business
      end
    end

end
