class HomeController < ApplicationController
  layout 'home', only: [:index]
  layout 'empty', except: [:index]

  protect_from_forgery :except => :comment

  def index
  end

  def get_top
    @about = About.last
    @entries = Entry.order('created_at desc').first(5)
    result = {about: @about.to_hash_for_about, records: @entries.map(&:to_hash_for_list)}
    render json: result
  end

  def get_works
  	@categories = Category.all
  	render json: @categories.map(&:to_hash)
  end

  def get_entry
    @entry = Entry.find_by_id params[:id]
    render json: @entry.to_hash
  end

  def get_contact
    @about = About.last
    result = @about.to_hash_for_contact
    render json: result
  end

  def get_tags
    @tags = ActsAsTaggableOn::Tag.most_used.map{|tag| if tag.taggings_count > 0 then {name: tag.name, count: tag.taggings_count} else nil end }
    render json: {tags: @tags.compact}
  end

  def get_tag
    @entries = Entry.tagged_with(params[:tag])
    render json: {entries: @entries.map(&:to_hash_for_list)}
  end

  def comment
    comment = Comment.new(comment: params[:comment], username: params[:username], useragent: params[:ua], entry_id: params[:entry_id])
    comment.user_id = current_user.id if current_user
    comment.save
    render json: {result: "ok"}
  end

end
