class AdministratorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :email
end
