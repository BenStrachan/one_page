
Business.create([{
  name: 'Hendra Physiotherapy',
  phone: '(07) 3062 7771',
  email: 'info@hendraphysio.com.au' }])

  puts "Business created"

User.create([{
  email: 'test@example.com',
  password: 'changeme',
  business_id: '1',
  role: User::ROLE_ADMIN
}])

puts "Admin user created! Email: test@example.com / Password: changeme"

HomeSetting.create([{
  introduction_title: 'introduction_title',
  introduction_description: 'introduction_description',
  careers_title: 'careers_title',
  careers_description: 'careers_description',
  business_id: '1',
  business_name: 'business_name',
  business_phone: 'business_phone',
  business_address: 'business_address',
  business_email: 'business_email'
}])

puts "Settings created"
