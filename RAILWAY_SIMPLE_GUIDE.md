# 🚂 Railway Deployment - Simple Step-by-Step Guide

## ⚠️ Fix Build Failures First!

Your builds are failing because Railway needs to know where your code is. Follow these steps:

---

## Step 1: Add MySQL Database

1. **Click the "+" button** (or "New" button) in Railway
2. **Select "Database"**
3. **Choose "MySQL"**
4. **Wait for it to create** (takes ~30 seconds)
5. **Click on the MySQL service** → Go to "Variables" tab
6. **Copy these values** (you'll need them):
   - `MYSQLHOST`
   - `MYSQLUSER` 
   - `MYSQLPASSWORD`
   - `MYSQLDATABASE`

---

## Step 2: Fix Backend Service

1. **Click on "amazon-clone-backend"** service
2. **Go to "Settings" tab** (top right)
3. **Find "Root Directory"** section
4. **Set Root Directory to:** `backend`
5. **Go to "Variables" tab**
6. **Add these environment variables:**
   ```
   DB_HOST = <paste MYSQLHOST from Step 1>
   DB_USER = <paste MYSQLUSER from Step 1>
   DB_PASSWORD = <paste MYSQLPASSWORD from Step 1>
   DB_NAME = <paste MYSQLDATABASE from Step 1>
   PORT = 5000
   NODE_ENV = production
   ```
7. **Save** - Railway will auto-redeploy

---

## Step 3: Fix Frontend Service

1. **Click on "amazon-clone-frontend"** service
2. **Go to "Settings" tab**
3. **Set Root Directory to:** `frontend`
4. **Scroll down to "Build Command"**
5. **Set Build Command to:** `npm install && npm run build`
6. **Scroll to "Start Command"**
7. **Set Start Command to:** `npx serve -s build -l 3000`
8. **Go to "Variables" tab**
9. **Add this environment variable:**
   ```
   REACT_APP_API_URL = https://amazon-clone-backend.railway.app/api
   ```
   *(Replace with your actual backend URL - you'll see it after backend deploys)*
10. **Save** - Railway will auto-redeploy

---

## Step 4: Get Backend URL

1. **Go back to "amazon-clone-backend"** service
2. **Click "Settings" tab**
3. **Scroll to "Domains" section**
4. **Copy the URL** (looks like: `https://amazon-clone-backend.railway.app`)
5. **Go back to frontend service** → "Variables" tab
6. **Update `REACT_APP_API_URL`** to: `https://your-backend-url.railway.app/api`
7. **Save**

---

## Step 5: Initialize Database

1. **Click on MySQL service**
2. **Go to "Data" tab**
3. **Click "Query" tab**
4. **Open `backend/database/schema.sql`** from your local project
5. **Copy ALL the SQL code** from that file
6. **Paste it into the Query box** in Railway
7. **Click "Run"** or press Ctrl+Enter
8. **Wait for success message**

*(Optional) If you have seed data:*
- Repeat with `seed_products.sql` and `seed_addresses.sql`

---

## Step 6: Check Deployments

1. **Go to "Architecture" view** (main page)
2. **Both services should show "Deployed"** (green) instead of "Build failed"
3. **Click on each service** → "Logs" tab to see if there are errors

---

## ✅ Success Checklist

- [ ] MySQL database created and running
- [ ] Backend service shows "Deployed" (green)
- [ ] Frontend service shows "Deployed" (green)
- [ ] Database schema executed successfully
- [ ] Backend URL is accessible
- [ ] Frontend URL is accessible
- [ ] Frontend can connect to backend (test in browser)

---

## 🔧 If Build Still Fails

### Backend Build Fails?
1. Check "Logs" tab in backend service
2. Common issues:
   - Missing dependencies → Check `package.json` is correct
   - Wrong root directory → Must be `backend`
   - Database connection error → Check environment variables

### Frontend Build Fails?
1. Check "Logs" tab in frontend service
2. Common issues:
   - Wrong root directory → Must be `frontend`
   - Build command wrong → Should be `npm install && npm run build`
   - Missing `serve` package → Start command uses `npx serve` (no install needed)

### Database Connection Error?
1. Verify all DB_* environment variables are set correctly
2. Make sure MySQL service is running (green status)
3. Check database name matches in variables

---

## 📝 Quick Reference

### Backend Settings:
- **Root Directory:** `backend`
- **Build Command:** (leave empty or `npm install`)
- **Start Command:** `npm start`

### Frontend Settings:
- **Root Directory:** `frontend`
- **Build Command:** `npm install && npm run build`
- **Start Command:** `npx serve -s build -l 3000`

### Required Environment Variables:

**Backend:**
```
DB_HOST=<from MySQL>
DB_USER=<from MySQL>
DB_PASSWORD=<from MySQL>
DB_NAME=<from MySQL>
PORT=5000
NODE_ENV=production
```

**Frontend:**
```
REACT_APP_API_URL=https://your-backend-url.railway.app/api
```

---

## 🎉 You're Done!

Once both services show "Deployed", visit your frontend URL and test the app!

