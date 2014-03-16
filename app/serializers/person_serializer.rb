class PersonSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :middle_name, :email, :company, :position, :gender, :full_name, :text

  def text
    object.full_name
  end
end
