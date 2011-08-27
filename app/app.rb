class FourKit < Padrino::Application
	register SassInitializer
	register Padrino::Rendering
	register Padrino::Mailer
	register Padrino::Helpers

	enable :sessions

	configure do
		Slim::Engine.set_default_options :pretty => true
	end
end
