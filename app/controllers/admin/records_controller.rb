class Admin::RecordsController < ApplicationController
  layout 'admin'
  before_action :require_login
  # GET /admin/records or /admin/records.json
  def index
    @records = Record.order(updated_at: :desc).page(page).per(20)
  end

  private
  
    def page
      params[:page] || 1
    end
end
