class DownloadsController < CrudController

  def show
    @download = Download.find(params[:id])
    unless cookies["downloads_"+@download.name] == "downloaded"
      cookies["downloads_"+@download.name] = "downloaded"
      @download.downloads_count += 1
      @download.save
    end
    redirect_to @download.download_address
  end

  private


end
