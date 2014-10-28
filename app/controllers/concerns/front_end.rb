module FrontEnd

  extend ActiveSupport::Concern

  private
  def index_html(namespace=nil)
    # return development_text unless Rails.env.production?
    @namespace = namespace

    index_key = if @namespace
                  "#{@namespace}:#{version_key params[:version]}:index.html"
                else
                  "#{version_key params[:version]}:index.html"
                end
    redis_text index_key
  end

  def redis_text index_key
    Rails.logger.info "*"*25
    Rails.logger.info "Redis Index_Key:"
    Rails.logger.info index_key

    #config/initializers/redis.rb
    $redis.get index_key
    content = $redis.get(index_key)
    return content ? content : "Redis Read Error: " + development_text
  end
  #In Development you'll likely see this, see README
  def development_text
    return if Rails.env.production?
    "You are viewing the API Development Index"
  end

  #Check params for a given key.
  def version_key version=nil

    check_version = "release" if version.blank?

    case check_version
    when 'release' then 'release'
    when 'canary' then $redis.lindex('releases',0)
    else
      check_version
    end


  end

  # #Read Redis for key, to obtain display string ( index html )
  # def latest_deploy
  #   manifest_key = (@namespace ? "#{@namespace}:" : '') + 'latest_ten_deploys'
  #   $redis.lindex manifest_key, 0
  # end

  # def current_deploy
  #   return latest_deploy unless Rails.env.production?
  #   deploy = @namespace ? frontend_deploy[@namespace] : frontend_deploy[:main]
  #   deploy == 'latest' ? latest_deploy : deploy
  # end


  # #Read YML for which release to return, essentially not used in production
  # def frontend_deploy
  #   frontend_deploy = YAML.load File.read Rails.root.join('config/frontend_deploy.yml')
  #   frontend_deploy.with_indifferent_access[:deploy]
  # end

end