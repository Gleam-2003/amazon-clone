# 🚀 Quick Deployment Guide - Railway

This is a condensed version of the full deployment guide. For detailed instructions, see `DEPLOYMENT_GUIDE.md`.

## ⚡ 5-Minute Railway Deployment

### Step 1: Push to GitHub
```bash
git add .
git commit -m "Ready for deployment"
git push origin main
```

### Step 2: Create Railway Project
1. Go to [railway.app](https://railway.app) and sign up/login
2. Click "New Project" → "Deploy from GitHub repo"
3. Select your repository

### Step 3: Add MySQL Database
1. In Railway project, click "+ New" → "Database" → "MySQL"
2. Wait for database to be created
3. Click on MySQL service → "Variables" tab
4. Copy these values:
   - `MYSQLHOST`
   - `MYSQLUSER`
   - `MYSQLPASSWORD`
   - `MYSQLDATABASE`

### Step 4: Initialize Database
1. In MySQL service → "Data" tab → "Query" tab
2. Copy contents of `backend/database/schema.sql`
3. Paste and execute
4. (Optional) Run seed files if you have them

### Step 5: Deploy Backend
1. Click "+ New" → "GitHub Repo" → Select your repo
2. In backend service settings:
   - **Root Directory:** `backend`
   - **Build Command:** `npm install`
   - **Start Command:** `npm start`
3. Go to "Variables" tab, add:
   ```
   DB_HOST=<MYSQLHOST from step 3>
   DB_USER=<MYSQLUSER from step 3>
   DB_PASSWORD=<MYSQLPASSWORD from step 3>
   DB_NAME=<MYSQLDATABASE from step 3>
   PORT=5000
   NODE_ENV=production
   ```
4. Wait for deployment
5. Copy backend URL (e.g., `https://amazon-clone-backend.railway.app`)

### Step 6: Deploy Frontend
1. Click "+ New" → "GitHub Repo" → Select your repo
2. In frontend service settings:
   - **Root Directory:** `frontend`
   - **Build Command:** `npm install && npm run build`
   - **Start Command:** `npx serve -s build -l 3000`
3. Go to "Variables" tab, add:
   ```
   REACT_APP_API_URL=https://your-backend-url.railway.app/api
   ```
   (Replace with your actual backend URL from Step 5)
4. Wait for deployment
5. Copy frontend URL

### Step 7: Update CORS (if needed)
1. In backend service → "Variables" tab
2. Add:
   ```
   FRONTEND_URL=https://your-frontend-url.railway.app
   ```
3. Redeploy backend (Railway auto-redeploys on env var changes)

### Step 8: Test
1. Visit your frontend URL
2. Test the application
3. Check browser console for errors

## ✅ Done!

Your app should now be live at your frontend URL!

## 🔧 Common Issues

**CORS Error?**
- Add `FRONTEND_URL` environment variable in backend
- Make sure it matches your frontend URL exactly (with https://)

**Database Connection Error?**
- Double-check all DB_* environment variables
- Ensure database service is running
- Verify schema.sql was executed

**Frontend Can't Connect to Backend?**
- Check `REACT_APP_API_URL` is set correctly
- Make sure backend URL ends with `/api`
- Verify backend is deployed and running

**Build Fails?**
- Check Railway logs for specific errors
- Ensure all dependencies are in package.json
- Verify Node.js version compatibility

---

For detailed troubleshooting, see `DEPLOYMENT_GUIDE.md`.

