# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def create_seeds_data
  password = 'project_rabel'
  user = User.create(:nickname => 'root', :email => 'root@rabelapp.com', :password => password, :password_confirmation => password)
  node = Node.create(:name => '电影', :key => 'movie',
                     :introduction => '一起看电影',
                     :custom_html => '<strong>推荐书目</strong>')
  topic = Topic.new(:title => '那继续晒一下韩国电影吧',
                          :content => '至少这个世纪前十年棒子电影那是相当的强势啊，水准很高，精品很多啊。')
  topic.user = user
  topic.hit = 1
  topic.nodes << node
  topic.save


  comment = topic.comments.new(:content => '大叔')
  comment.user = user
  comment.save

  user2 = User.create(:nickname => 'DHH', :email => 'dhh@example.com', :password => password, :password_confirmation => password)
  node2 = Node.create(:name => 'Rails 3', :key => 'rails3', :introduction => 'Ruby on Rails')
  topic2 = Topic.new(:title => 'Rails is not for beginners', :content => 'Rails is cool, but not for beginners')
  topic2.user = user2
  topic2.hit = 100
  topic2.nodes << node2
  topic2.save

  user3 = User.create(:nickname => 'Linus', :email => 'linus@linux.org', :password => password, :password_confirmation => password)
  node3 = Node.create(:name => 'C', :key => 'c_programming')
  topic3 = Topic.new(:title => 'Linux 3.0 released')
  topic3.user = user3

  topic3.nodes << node3
  topic3.save

  Page.create(:key => 'about', :title => '关于我们', :content => '这是一个用rabel搭建的现代社区')
end

create_seeds_data unless Rails.env.production?

