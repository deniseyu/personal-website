require 'sinatra/base'
require 'sinatra/assetpack'
require 'yaml'
require 'google/cloud/storage'

class PersonalWebsite < Sinatra::Base
  register Sinatra::AssetPack

  get '/' do
    erb :index
  end

  get '/talks' do
    erb :talks
  end

  get '/art' do
    y = ImageLoader.new('./arts.yml')
    @talk_sketchnotes = y.section("talk-sketchnotes")
    @topic_sketchnotes = y.section("topic-sketchnotes")
    @gophers = y.section("gophers")
    @cats = y.section("cats")
    @doodles = y.section("misc")

    @bucket = y.bucket

    erb :"new-gallery"
  end

  get '/distsystalk' do
    erb :distsystalk
  end

  get '/sketchnoting' do
    send_file(File.join(settings.public_folder, 'sketchnoting-talk.pdf'))
  end

  get '/odb' do
    erb :odbtalk
  end

  get '/techtalks' do
    erb :techtalks
  end

  get '/letssketchtech' do
    erb :letssketchtech
  end

  get '/srecon' do
    erb :srecon
  end

  get '/srecon-slides' do
    send_file(File.join(settings.public_folder, 'dist-sys-deck.pdf'))
  end

  get '/sponsorship' do
    send_file(File.join(settings.public_folder, 'sponsorship-deck.pdf'))
  end

  get '/onboarding' do
    send_file(File.join(settings.public_folder, 'onboarding-deck.pdf'))
  end

  get '/feedback-week' do
    erb :feedback_week
  end

  get '/gocon' do
    send_file(File.join(settings.public_folder, 'tdd-golang.pdf'))
  end

  get '/dev-portfolios' do
    send_file(File.join(settings.public_folder, 'dev-portfolios-deck.pdf'))
  end
end

class ImageLoader
  attr_reader :bucket

  def initialize(data = './arts.yml')
    f = File.open("/tmp/gcloud_creds.json", "w")
    f.write(ENV['gcloud_credentials'])
    f.close

    storage = Google::Cloud::Storage.new(
      project_id: ENV['project_id'],
      credentials: "/tmp/gcloud_creds.json"
    )

    @bucket = storage.bucket(ENV['bucket_name'])
    @data = YAML.load_file(data)

    File.delete("/tmp/gcloud_creds.json")
  end

  def section(category)
    @data.select{|i| i["category"] == category}.first["assets"]
  end

  def conference_section(conference)
    section("talk-images")["conferences"].select{|i| i["name"] == conference}.first
  end
end
