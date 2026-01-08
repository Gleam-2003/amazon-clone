# 🚨 FIX RAILWAY BUILD FAILURES - Do This Now!

## The Problem
Both services are failing because Railway doesn't know where your code is located.

## The Fix (5 Minutes)

### 🔴 Step 1: Fix Backend (Do This First!)

1. **Click on "amazon-clone-backend"** card
2. **Click "Settings"** (top menu)
3. **Scroll to "Root Directory"**
4. **Type:** `backend`
5. **Click "Save"** (bottom of page)
6. **Go to "Variables" tab**
7. **Add these 5 variables:**
   ```
   DB_HOST = (get from MySQL service → Variables → MYSQLHOST)
   DB_USER = (get from MySQL service → Variables → MYSQLUSER)
   DB_PASSWORD = (get from MySQL service → Variables → MYSQLPASSWORD)
   DB_NAME = (get from MySQL service → Variables → MYSQLDATABASE)
   PORT = 5000
   ```
8. **Click "Save"** - Backend will redeploy automatically

---

### 🔴 Step 2: Fix Frontend

1. **Click on "amazon-clone-frontend"** card
2. **Click "Settings"**
3. **Set "Root Directory" to:** `frontend`
4. **Set "Build Command" to:** `npm install && npm run build`
5. **Set "Start Command" to:** `npx serve -s build -l 3000`
6. **Click "Save"**
7. **Go to "Variables" tab**
8. **Add this variable:**
   ```
   REACT_APP_API_URL = https://amazon-clone-backend.railway.app/api
   ```
   *(You'll update this URL after backend deploys - get it from backend Settings → Domains)*
9. **Click "Save"**

---

### 🟢 Step 3: Add MySQL Database (If Not Done)

1. **Click "+" or "New" button**
2. **Select "Database"**
3. **Choose "MySQL"**
4. **Wait 30 seconds for it to create**
5. **Click MySQL service → "Variables" tab**
6. **Copy the 4 values** (MYSQLHOST, MYSQLUSER, MYSQLPASSWORD, MYSQLDATABASE)
7. **Use these in Backend Variables** (Step 1)

---

### 🟢 Step 4: Initialize Database

1. **Click MySQL service**
2. **Go to "Data" tab → "Query" tab**
3. **Open your local file:** `backend/database/schema.sql`
4. **Copy ALL the SQL code**
5. **Paste into Query box**
6. **Click "Run"**
7. **Should see "Success"**

---

### ✅ Step 5: Update Frontend URL

1. **Go to backend service → Settings → Domains**
2. **Copy the URL** (e.g., `https://amazon-clone-backend-production.up.railway.app`)
3. **Go to frontend service → Variables**
4. **Update `REACT_APP_API_URL`** to: `https://your-actual-backend-url.railway.app/api`
5. **Save**

---

## 🎯 Quick Settings Summary

### Backend:
```
Root Directory: backend
Build Command: (leave empty)
Start Command: npm start
```

### Frontend:
```
Root Directory: frontend
Build Command: npm install && npm run build
Start Command: npx serve -s build -l 3000
```

---

## ✅ Check Success

1. **Go to Architecture page**
2. **Both services should be GREEN** (not red)
3. **Click each service → "Logs" tab**
4. **Should see "Server running on port 5000" for backend**
5. **Should see "Serving!" for frontend**

---

## 🆘 Still Failing?

**Check the Logs:**
- Click service → "Logs" tab
- Look for error messages
- Common fixes:
  - Wrong root directory → Must be exactly `backend` or `frontend`
  - Missing env vars → Add all variables from Step 1
  - Database error → Check MySQL is running and variables are correct

---

**That's it! Follow these steps and your app will deploy! 🚀**

