module ApplicationHelper

	def format_date(date_text)
		date_text.strftime("%b %d %Y") rescue ""
	end

	def show_message(message, kind = "success")
		if !message.blank? && message.length > 0
			"
			<div class='error-message'>
				<div class='alert alert-#{kind} alert-dismissable'>
					<button class='close' aria-hidden='true' data-dismiss='alert' type='button'>&times</button>
					#{message}
				</div>
			</div>
			".html_safe
		end
	end
	
end
