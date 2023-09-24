TWITTER_CONSUMER_KEY='RE80WGhvUEc2bllwUU91MGIyY0M6MTpjaQ'
TWITTER_CONSUMER_SECRET='Sq1S9gHS2W52CGwK4PZIUEEqOKOTUaUQ3kJe1ILsqHJT_sNYzw'


Rails.application.config.middleware.use OmniAuth::Builder do
    
    
    provider :developer if Rails.env.development?

    provider(:twitter2, 
    TWITTER_CONSUMER_KEY,
    TWITTER_CONSUMER_SECRET,
    callback_path: '/auth/twitter2/callback', 
    )
    
  end