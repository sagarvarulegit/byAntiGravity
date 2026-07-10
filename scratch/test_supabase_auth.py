import requests
import json

url = "https://ervvgjioggfxygtjlpts.supabase.co/auth/v1"
headers = {
    "apikey": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVydnZnamlvZ2dmeHlndGpscHRzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODA0NzE5OTgsImV4cCI6MjA5NjA0Nzk5OH0.EzYtQrAoBJ_kGd36mPOsmfcsGSV8hLnOs1dc5sCSr4I",
    "Content-Type": "application/json"
}

def signup(email, password):
    signup_url = f"{url}/signup"
    data = {
        "email": email,
        "password": password,
        "data": {"full_name": "Sagar Test Python"}
    }
    r = requests.post(signup_url, headers=headers, json=data)
    print("Signup Status:", r.status_code)
    print("Signup Response:", r.text)
    return r.json()

def login(email, password):
    login_url = f"{url}/token?grant_type=password"
    data = {
        "email": email,
        "password": password
    }
    r = requests.post(login_url, headers=headers, json=data)
    print("Login Status:", r.status_code)
    print("Login Response:", r.text)
    return r.json()

if __name__ == "__main__":
    import time
    test_email = f"sagar_py_{int(time.time())}@gmail.com"
    test_password = "Password@123"
    
    print(f"Testing with email: {test_email}")
    print("--- Signing Up ---")
    signup(test_email, test_password)
    
    print("--- Logging In ---")
    login(test_email, test_password)
