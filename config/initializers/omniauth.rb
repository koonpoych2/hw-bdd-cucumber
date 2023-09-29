TWITTER_CONSUMER_KEY='RE80WGhvUEc2bllwUU91MGIyY0M6MTpjaQ'
TWITTER_CONSUMER_SECRET='BZGGV0o7O2d0uOOxL_Wrxvg3ZODZPYpuBlAubdHSJVQoKsa3bO'


Rails.application.config.middleware.use OmniAuth::Builder do
    
    
    provider :developer if Rails.env.development?

    provider(:twitter2, 
    TWITTER_CONSUMER_KEY,
    TWITTER_CONSUMER_SECRET,
    callback_path: '/auth/twitter2/callback', 
    )
    
  end