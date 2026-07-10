import requests

headers = {
    "apikey": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVydnZnamlvZ2dmeHlndGpscHRzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODA0NzE5OTgsImV4cCI6MjA5NjA0Nzk5OH0.EzYtQrAoBJ_kGd36mPOsmfcsGSV8hLnOs1dc5sCSr4I",
    "Content-Type": "application/json"
}

def check_table(table_name):
    url = f"https://ervvgjioggfxygtjlpts.supabase.co/rest/v1/{table_name}?select=*"
    r = requests.get(url, headers=headers)
    print(f"--- Table {table_name} (Status: {r.status_code}) ---")
    try:
        data = r.json()
        print(f"Total Rows: {len(data)}")
        for row in data:
            if 'name' in row:
                print(f"  - {row.get('name')} (id: {row.get('id')})")
            elif 'title' in row:
                print(f"  - {row.get('title')} (id: {row.get('id')})")
            else:
                print(f"  - id: {row.get('id')}")
    except Exception as e:
        print("Error:", e)
        print("Response:", r.text)

check_table("subjects")
check_table("chapters")
