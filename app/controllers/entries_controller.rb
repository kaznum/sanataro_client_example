class EntriesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_oauth
  def index
    @accounts = Account.all
    @entries = Entry.all
  end

  def set_oauth
    if current_user.sanataro
      [Entry, Account].each do |c|
        c.headers['authorization'] = 'Bearer ' + current_user.sanataro.client.token
      end
    end
  end
end
