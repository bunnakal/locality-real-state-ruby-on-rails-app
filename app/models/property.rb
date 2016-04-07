class Property < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  belongs_to :type
  belongs_to :user
  has_many :galleries
  mount_uploader :image, ImageUploader # Tells rails to use this uploader for this model.
  accepts_nested_attributes_for :galleries
  validates :title, :description, :status, :price, :spec, :address, presence: true
  validates :description, length: { minimum: 80 }
  validates :price, numericality: true
  validates_presence_of :image

  FEATURE_PRICE = 200000
  STATUS = ['Rent','Sale']
  validates :status, inclusion: {in: STATUS}

  LOCATION = {
  	'Phnom Penh'=>['Chamkar Mon','Doun Penh','Prampir Meakkakra','Tuol Kouk',
  		'Dangkao','Mean Chey','Ruessei Kaev','Sen Sok','Pou Senchey','Chrouy Changvar',
  		'Preaek Pnov','Chbar Ampov'],
  	'Kandal'=>['Angsnoul'],
  	'Banteay Meanchey':[],
  	'Battambang'=>[],
  	'Kampong Cham'=>[],
  	'	Kampong Chhnang'=>[],
  	'Kampong Speu'=>[],
  	'Kampong Thom'=>[],
  	'Kampot'=>[],
  	'Koh Kong'=>[],
  	'Kep'=>[],
  	'Kratié'=>[],
  	'Mondulkiri'=>[],
  	'Oddar Meanchey'=>[],
  	'Pailin'=>[],
  	'Preah Sihanouk'=>[],
  	'Preah Vihear'=>[],
  	'Pursat'=>[],
  	'Prey Veng'=>[],
  	'Ratanakiri'=>[],
  	'Stung Treng'=>[],
  	'Svay Rieng'=>[],
  	'Takéo'=>[],
  	'Tboung Khmum'=>['Memot','Tboung Khmum']	
  }
end
