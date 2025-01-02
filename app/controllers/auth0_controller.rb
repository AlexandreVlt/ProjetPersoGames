class Auth0Controller < ApplicationController

  def callback
    auth_info = request.env['omniauth.auth']
    session[:credentials] = {}
    session[:credentials][:id_token] = auth_info['credentials']['id_token']
    redirect_to games_path
  end

  def failure
    @error_msg = request.params['message']
  end

  def logout
    reset_session
    redirect_to logout_url, allow_other_host: true
  end

  private

  def logout_url
    request_params = {
      returnTo: "http://127.0.0.1:3000/games",
      client_id: AUTH0_CONFIG['auth0_client_id']
    }

    URI::HTTPS.build(host: AUTH0_CONFIG['auth0_domain'], path: '/v2/logout', query: request_params.to_query).to_s
  end
end
