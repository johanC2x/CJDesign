ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
	:address 				=> 'smtp.gmail.com',
	:port    				=> '587',
	:authentication 		=> :plain,
	:user_name   			=> 'johins2x@gmail.com',
	:pasword   				=> 'J993130699@',
	:enable_startttls_auto  => true, 
}