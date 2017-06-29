class Profile < ApplicationRecord
  has_many :directories, dependent: :destroy
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :first_name,  presence: {message: "first name has to be present"}
  validates :last_name,  presence: {message: "last name has to be present"}
  validates :address, presence: {message: "address has to be present"}
  validates :phone_number, presence: {message: "please add you phone number"}
  validates :gender, presence: {message: "gender has to be present"}
  validates :age, presence: {message: "age has to be present "}
  validates :nationality, presence: {message: "nationality has to be present"}
  validates :job, presence: {message: "Marital Status has to be present"}
  validates :emr_name, presence: {message: " Emergency Contact Name has to be present"}
  validates :emr_phone, presence: {message: "Emergency Contact Number has to be present"}
  validates :lang, presence: {message: "language e has to be present"}
  def self.search_profiles(search)
    where("first_name ILIKE ?  OR last_name ILIKE ? OR first_name_arabic ILIKE ? OR last_name_arabic ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}")
  end
end
