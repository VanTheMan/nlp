class ScriptsController < ApplicationController
	def index
		@translated_scripts = Script.where("v_content != ?", "").order("updated_at DESC");
		@translated_scripts =  Kaminari.paginate_array(@translated_scripts).page(params[:page]).per(10)
	end

	def edit
		@script = Script.not_translate.sample(1).first
		@related_scripts = Script.where("script_number" => @script.script_number)
	end

	def update
		@script = Script.find(params[:id])
		# binding.pry
		@script.update_attributes(params[:script])
		# binding.pry
		if @script.save	
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
