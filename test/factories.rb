Factory.define :user do |f|
  f.sequence(:login) {|n| "joe#{n}" }
  f.password "password"
  f.password_confirmation {|user| user.password}
end

Factory.define :profile do |f|
  f.association :user
  f.sequence(:email) {|n| "joe#{n}@example.com" }
  f.fullname 'Joe Sixpack'
  f.address '1600 Amphitheatre Parkway'
  f.city 'Mountain View'
  f.province 'California'
  f.country 'USA'
  f.postal_code '94043'
end

Factory.define :invitation do |f|
  f.association :user
  f.recipient_email 'jack@example.com'
  f.subject 'hit the road, Jack'
  f.content 'feel invited to Invitator app'
end