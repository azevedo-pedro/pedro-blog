# Create admin user from environment variables (idempotent)
admin_email = ENV.fetch("ADMIN_EMAIL", "admin@pedro.blog")
admin_password = ENV.fetch("ADMIN_PASSWORD", "admin123")

admin = Admin.find_or_initialize_by(email: admin_email)
admin.password = admin_password
admin.password_confirmation = admin_password
admin.save!

puts "Admin created/updated: #{admin_email}"
