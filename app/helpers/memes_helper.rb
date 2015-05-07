module MemesHelper
	# thanks, viking_blogger ;)
	def form_field_error_message(resource, field_sym)
	  unless resource.errors[field_sym].empty?
	    content_tag(:span, :class => "error-message") do
	      "#{field_sym.to_s.titleize} #{resource.errors[field_sym].first}"
	    end
	  end
	end

	def meme_author(meme)
		User.find(meme.author_id).username
	end

	def minutes_ago(meme)
		((Time.zone.now - meme.created_at)/60).round
	end

	def build_link(meme)
		meme_path(meme.id)
	end

end
