class Cpanel::MembersController < Cpanel::ApplicationController
	def index
		@members = Member.all
	end
end
