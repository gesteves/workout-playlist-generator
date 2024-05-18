class PreferencesController < ApplicationController
  before_action :authenticate_user!

  def edit
    @preference = current_user.preference || current_user.build_preference
  end

  def update
    @preference = current_user.preference || current_user.build_preference
    if @preference.update(preference_params)
      redirect_to root_path, notice: 'Preferences updated successfully.'
    else
      render :edit
    end
  end

  private

  def preference_params
    params.require(:preference).permit(:likes, :dislikes, :calendar_url)
  end
end
