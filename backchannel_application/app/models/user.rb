class User < ActiveRecord::Base
  attr_accessible :username, :password

  attr_accessor :password


  validates_presence_of :password, :on => :create
  validates_presence_of :username
  validates_uniqueness_of :username

  def self.authenticate(username, password)
    user = find_by_username(username)
    if user.password == password
      user
    else
      nil
    end
  end


  end


