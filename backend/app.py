from fastapi import FastAPI, HTTPException, status
from pydantic import BaseModel, EmailStr
from werkzeug.security import generate_password_hash, check_password_hash
from fastapi.middleware.cors import CORSMiddleware
import smtplib
from email.mime.text import MIMEText
import uuid
from datetime import datetime, timedelta

app = FastAPI()
print("✅ FastAPI Server is running!")

# CORS Middleware للسماح للطلبات من أي مصدر (Flutter, Postman ...)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# قاعدة بيانات وهمية للمستخدمين
users_db = []

# تخزين التوكن مؤقتاً لإعادة تعيين كلمة السر
reset_tokens = {}  # {token: {"email": ..., "expiry": datetime}}

# النماذج
class SignupData(BaseModel):
    email: EmailStr
    password: str
    username: str

class LoginData(BaseModel):
    email: EmailStr
    password: str

class ForgotPasswordRequest(BaseModel):
    email: EmailStr

class ResetPasswordData(BaseModel):
    token: str
    new_password: str

# ----------------------------
# دوال مساعدة للتوكن
def generate_reset_token(email: str):
    token = str(uuid.uuid4())
    expiry = datetime.utcnow() + timedelta(minutes=15)  # صالح 15 دقيقة
    reset_tokens[token] = {"email": email, "expiry": expiry}
    return token

def validate_token(token: str):
    data = reset_tokens.get(token)
    if not data:
        return None
    if datetime.utcnow() > data["expiry"]:
        reset_tokens.pop(token)
        return None
    return data["email"]

# ----------------------------
# إرسال إيميل عبر SMTP Gmail
def send_email(to_email: str, reset_link: str):
    sender_email = "hassanradi143@gmail.com"
    sender_password = "iedu rrui vvwq kywc"  # App password من Gmail

    subject = "Reset your password"
    body = f"Click the link to reset your password:\n\n{reset_link}\n\nThis link is valid for 15 minutes."

    msg = MIMEText(body)
    msg["Subject"] = subject
    msg["From"] = sender_email
    msg["To"] = to_email

    with smtplib.SMTP_SSL("smtp.gmail.com", 465) as server:
        server.login(sender_email, sender_password)
        server.sendmail(sender_email, to_email, msg.as_string())

# ----------------------------
@app.get("/")
def read_root():
    return {"message": "✅ FastAPI Server is running!"}

# إنشاء حساب جديد
@app.post("/signup", status_code=status.HTTP_201_CREATED)
def signup(data: SignupData):
    if any(user["email"] == data.email for user in users_db):
        raise HTTPException(status_code=400, detail="Email already registered")

    hashed_password = generate_password_hash(data.password)
    new_user = {
        "id": len(users_db) + 1,
        "email": data.email,
        "username": data.username,
        "password": hashed_password
    }
    users_db.append(new_user)
    return {"message": "User created successfully", "user_id": new_user["id"]}

# تسجيل الدخول
@app.post("/login")
def login(data: LoginData):
    user = next((u for u in users_db if u["email"] == data.email), None)
    if not user or not check_password_hash(user["password"], data.password):
        raise HTTPException(status_code=401, detail="Invalid email or password")
    return {
        "message": "Login successful",
        "user_id": user["id"],
        "username": user["username"],
    }

# نسيت كلمة السر - إرسال رابط إعادة تعيين
@app.post("/forgot-password")
def forgot_password(data: ForgotPasswordRequest):
    email = data.email
    user = next((u for u in users_db if u["email"] == email), None)
    if not user:
        raise HTTPException(status_code=404, detail="Email not found")

    token = generate_reset_token(email)
    reset_link = f"http://localhost:3000/reset-password?token={token}"  # غيّر حسب رابط التطبيق

    try:
        send_email(email, reset_link)
        return {"message": "Reset link sent to your email"}
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Failed to send email: {str(e)}")

# إعادة تعيين كلمة السر
@app.post("/reset-password")
def reset_password(data: ResetPasswordData):
    email = validate_token(data.token)
    if not email:
        raise HTTPException(status_code=400, detail="Invalid or expired token")

    user = next((u for u in users_db if u["email"] == email), None)
    if not user:
        raise HTTPException(status_code=404, detail="User not found")

    user["password"] = generate_password_hash(data.new_password)
    reset_tokens.pop(data.token)  # إزالة التوكن بعد الاستخدام

    return {"message": "Password updated successfully"}

# لتشغيل السيرفر
if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000, reload=True)
@app.get("/clear-users")
def clear_users():
    users_db.clear()
    return {"message": "All users cleared ✅"}
