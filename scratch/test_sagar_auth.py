import requests

url = "https://ervvgjioggfxygtjlpts.supabase.co/auth/v1/token?grant_type=password"
headers = {
    "apikey": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVydnZnamlvZ2dmeHlndGpscHRzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODA0NzE5OTgsImV4cCI6MjA5NjA0Nzk5OH0.EzYtQrAoBJ_kGd36mPOsmfcsGSV8hLnOs1dc5sCSr4I",
    "Content-Type": "application/json"
}

data = {
    "email": "sagar.varule@gmail.com",
    "password": "Password@123"
}

r = requests.post(url, headers=headers, json=data)
print("Login Status:", r.status_code)
print("Login Response:", r.text)
