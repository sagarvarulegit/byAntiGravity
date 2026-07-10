import requests
import json

url = "https://ervvgjioggfxygtjlpts.supabase.co/rest/v1/subjects"
headers = {
    "apikey": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVydnZnamlvZ2dmeHlndGpscHRzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODA0NzE5OTgsImV4cCI6MjA5NjA0Nzk5OH0.EzYtQrAoBJ_kGd36mPOsmfcsGSV8hLnOs1dc5sCSr4I",
    "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVydnZnamlvZ2dmeHlndGpscHRzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODA0NzE5OTgsImV4cCI6MjA5NjA0Nzk5OH0.EzYtQrAoBJ_kGd36mPOsmfcsGSV8hLnOs1dc5sCSr4I",
    "Content-Type": "application/json",
    "Prefer": "return=representation"
}
data = {
    "id": "e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a99",
    "name": "Test Subject",
    "code": "TEST99",
    "description": "Testing RLS"
}

try:
    response = requests.post(url, headers=headers, json=data)
    print(f"Status Code: {response.status_code}")
    print(f"Response: {response.text}")
except Exception as e:
    print(f"Error: {e}")
