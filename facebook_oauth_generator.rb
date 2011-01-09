class FacebookOauthGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def apply_patch
    patch_file_path = File.expand_path('../facebook_oauth.patch', __FILE__)
    gsub_file(patch_file_path, '[APPNAME]', Rails::Application.instance.class.name)
    say run "patch -p0 < #{patch_file_path}"
  end
end