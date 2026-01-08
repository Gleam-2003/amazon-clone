# 🚀 Deployment Guide - Amazon Clone

This guide will help you deploy your full-stack Amazon Clone application (Frontend, Backend, and Database) to a cloud platform.

## 📊 Platform Comparison

| Feature | Railway | Render | Vercel |
|---------|---------|--------|--------|
| Frontend Hosting | ✅ Yes | ✅ Yes | ✅ Excellent |
| Backend Hosting | ✅ Yes | ✅ Yes | ⚠️ Serverless only |
| MySQL Database | ✅ Native | ⚠️ PostgreSQL only | ❌ No |
| All-in-One | ✅ Yes | ✅ Yes | ❌ No |
| Free Tier | ✅ Yes | ✅ Yes | ✅ Yes |
| **Best For** | **⭐ Recommended** | Good alternative | Frontend only |

## 🎯 Recommended: Railway (Best for Your Project)

Railway is the best choice because:
- ✅ Native MySQL support (your project uses MySQL)
- ✅ Can host frontend, backend, and database in one project
- ✅ Simple deployment process
- ✅ Free tier with $5 credit monthly

---

## 🚂 Railway Deployment Guide

### Prerequisites
1. GitHub account (your code should be in a GitHub repository)
2. Railway account (sign up at [railway.app](https://railway.app))

### Step 1: Prepare Your Repository

1. **Push your code to GitHub** (if not already done):
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin <your-github-repo-url>
   git push -u origin main
   ```

2. **Create `.env.example` files** (if they don't exist):

   **Backend `.env.example`:**
   ```env
   DB_HOST=localhost
   DB_USER=root
   DB_PASSWORD=your_password
   DB_NAME=amazon_clone
   PORT=5000
   ```

   **Frontend `.env.example`:**
   ```env
   REACT_APP_API_URL=http://localhost:5000/api
   ```

### Step 2: Deploy Database on Railway

1. **Go to Railway Dashboard** → Click "New Project"
2. **Select "Deploy from GitHub repo"** → Choose your repository
3. **Add MySQL Database:**
   - Click "+ New" → Select "Database" → Choose "MySQL"
   - Railway will automatically create a MySQL database
   - Note down the connection details (shown in the database service)

### Step 3: Deploy Backend on Railway

1. **Add Backend Service:**
   - In the same project, click "+ New" → "GitHub Repo"
   - Select your repository
   - Railway will detect it's a Node.js app

2. **Configure Backend:**
   - **Root Directory:** Set to `backend`
   - **Build Command:** `npm install`
   - **Start Command:** `npm start`

3. **Set Environment Variables:**
   - Go to the backend service → "Variables" tab
   - Add these variables (use the MySQL connection details from Step 2):
     ```
     DB_HOST=<from MySQL service>
     DB_USER=<from MySQL service>
     DB_PASSWORD=<from MySQL service>
     DB_NAME=<from MySQL service>
     PORT=5000
     NODE_ENV=production
     ```

4. **Generate Backend URL:**
   - Railway will provide a URL like: `https://your-backend.railway.app`
   - Copy this URL

### Step 4: Initialize Database

1. **Connect to Railway MySQL:**
   - In Railway, go to your MySQL service
   - Click "Connect" → Copy the connection string
   - Use a MySQL client (like MySQL Workbench, DBeaver, or Railway's built-in terminal)

2. **Run Schema:**
   ```bash
   # Option 1: Using Railway's MySQL terminal
   # In Railway MySQL service → "Data" tab → "Query" tab
   # Copy and paste the contents of backend/database/schema.sql
   
   # Option 2: Using local MySQL client
   mysql -h <railway-mysql-host> -u <user> -p <database> < backend/database/schema.sql
   ```

3. **Seed Database (Optional):**
   ```bash
   # Run seed files if you have them
   mysql -h <railway-mysql-host> -u <user> -p <database> < backend/database/seed_products.sql
   ```

### Step 5: Deploy Frontend on Railway

1. **Add Frontend Service:**
   - In the same Railway project, click "+ New" → "GitHub Repo"
   - Select your repository again

2. **Configure Frontend:**
   - **Root Directory:** Set to `frontend`
   - **Build Command:** `npm install && npm run build`
   - **Start Command:** `npx serve -s build -l 3000`
   - **OR use Railway's static site option:**
     - Change service type to "Static Site"
     - Build command: `npm install && npm run build`
     - Output directory: `build`

3. **Set Environment Variables:**
   - Go to frontend service → "Variables" tab
   - Add:
     ```
     REACT_APP_API_URL=https://your-backend.railway.app/api
     ```
   - Replace `your-backend.railway.app` with your actual backend URL from Step 3

4. **Generate Frontend URL:**
   - Railway will provide a URL like: `https://your-frontend.railway.app`

### Step 6: Configure CORS (Important!)

Update your backend `server.js` to allow your frontend domain:

```javascript
// In backend/server.js
const cors = require("cors");

const corsOptions = {
  origin: [
    'http://localhost:3000',
    'https://your-frontend.railway.app', // Add your Railway frontend URL
  ],
  credentials: true,
};

app.use(cors(corsOptions));
```

### Step 7: Test Your Deployment

1. Visit your frontend URL
2. Test the application:
   - Browse products
   - Add items to cart
   - Place an order

---

## 🎨 Alternative: Render Deployment Guide

If you prefer Render, here's how to deploy:

### Render Setup

**Note:** Render uses PostgreSQL by default. You have two options:
1. **Migrate to PostgreSQL** (recommended for Render)
2. **Use external MySQL service** (like PlanetScale, Aiven, or AWS RDS)

### Option A: Using PostgreSQL (Recommended for Render)

1. **Create PostgreSQL Database:**
   - Go to Render Dashboard → "New" → "PostgreSQL"
   - Note the connection string

2. **Update Backend for PostgreSQL:**
   - Install `pg` instead of `mysql2`: `npm install pg`
   - Update `backend/config/db.js` to use PostgreSQL connection
   - Update SQL schema to PostgreSQL syntax

3. **Deploy Backend:**
   - "New" → "Web Service" → Connect GitHub repo
   - Root Directory: `backend`
   - Build: `npm install`
   - Start: `npm start`
   - Environment Variables: Add database connection details

4. **Deploy Frontend:**
   - "New" → "Static Site" → Connect GitHub repo
   - Root Directory: `frontend`
   - Build: `npm install && npm run build`
   - Publish Directory: `build`
   - Environment Variables: `REACT_APP_API_URL=<your-backend-url>/api`

### Option B: Using External MySQL (Keep Current Setup)

1. **Use PlanetScale (Free MySQL):**
   - Sign up at [planetscale.com](https://planetscale.com)
   - Create a database
   - Get connection string
   - Use this in your Render backend environment variables

2. **Deploy on Render:**
   - Follow same steps as above, but use PlanetScale MySQL connection string

---

## 🔧 Important Configuration Files

### Backend: `railway.json` or `package.json` scripts

You can add a `railway.json` in the backend folder:

```json
{
  "$schema": "https://railway.app/railway.schema.json",
  "build": {
    "builder": "NIXPACKS",
    "buildCommand": "npm install"
  },
  "deploy": {
    "startCommand": "npm start",
    "restartPolicyType": "ON_FAILURE",
    "restartPolicyMaxRetries": 10
  }
}
```

### Frontend: Update API URL

Make sure your frontend `.env` or environment variables point to the deployed backend URL.

---

## 🐛 Troubleshooting

### Database Connection Issues
- ✅ Verify environment variables are set correctly
- ✅ Check MySQL service is running in Railway
- ✅ Ensure database name, user, and password match
- ✅ Verify network access (Railway services in same project can communicate)

### CORS Errors
- ✅ Update backend CORS to include your frontend URL
- ✅ Check backend URL is correct in frontend environment variables

### Build Failures
- ✅ Check Node.js version compatibility
- ✅ Verify all dependencies are in `package.json`
- ✅ Check build logs in Railway dashboard

### Frontend Not Loading
- ✅ Verify `REACT_APP_API_URL` is set correctly
- ✅ Check backend is running and accessible
- ✅ Verify build completed successfully

---

## 📝 Quick Checklist

- [ ] Code pushed to GitHub
- [ ] Railway account created
- [ ] MySQL database created on Railway
- [ ] Database schema executed
- [ ] Backend deployed with correct environment variables
- [ ] Frontend deployed with backend URL in environment variables
- [ ] CORS configured in backend
- [ ] Tested application end-to-end

---

## 💰 Cost Estimate

### Railway (Free Tier)
- $5 credit per month
- Usually enough for small projects
- Pay-as-you-go after free credit

### Render (Free Tier)
- Free tier available
- Services may sleep after inactivity (free tier)
- PostgreSQL database included

---

## 🎉 Success!

Once deployed, your application will be live at:
- **Frontend:** `https://your-frontend.railway.app`
- **Backend API:** `https://your-backend.railway.app/api`
- **Database:** Managed by Railway (no direct URL needed)

---

## 📚 Additional Resources

- [Railway Documentation](https://docs.railway.app)
- [Render Documentation](https://render.com/docs)
- [MySQL on Railway](https://docs.railway.app/databases/mysql)

---

**Need Help?** Check the troubleshooting section or Railway/Render support documentation.

