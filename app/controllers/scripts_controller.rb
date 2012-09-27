class ScriptsController < ApplicationController
	def index
		@translated = Script.where("v_content != ?", "").order("updated_at DESC");
		@translated_scripts =  Kaminari.paginate_array(@translated).page(params[:page]).per(10)
		@user = User.new
		@scripts = Script.all
		# session[:user_id] = 0
		# binding.pry
	end

	def edit
		# binding.pry
		@script = Script.not_translate.sample(1).first
		@related_scripts = Script.where("script_number" => @script.script_number)
	end

	def update
		@script = Script.find(params[:id])
		# binding.pry
		@script.update_attributes(params[:script])
		# binding.pry
		if @script.save	
			if @script.v_content != ""
				current_user.num_translate += 1
				current_user.save
			end
			@random_script = Script.not_translate.sample(1).first
			@related_scripts = Script.where("script_number" => @random_script.script_number)
			html = render_to_string :partial => "script_content", :layout => false, :locals => { script: @random_script, related_scripts: @related_scripts}
			# binding.pry
			respond_to do |format| 
				format.html { redirect_to edit_scripts_path() }
				format.json { render json: { success: true, html: html } }
			end
		else
			respond_to do |format| 
				format.html { redirect_to edit_scripts_path() }
				format.json { render json: { success: false } }
			end
		end
	end

	def show
		@script = Script.find(params[:id])
	end

end
