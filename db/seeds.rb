
Business.create([{
  name: 'Hendra Physiotherapy',
  phone: '(07) 3062 7771',
  email: 'info@hendraphysio.com.au' }])

  puts "Business created"

User.create(
  email: 'test@example.com',
  password: 'changeme',
  business_id: '1',
  role: User::ROLE_ADMIN
)

  puts "Admin user created! Email: test@example.com / Password: changeme"
