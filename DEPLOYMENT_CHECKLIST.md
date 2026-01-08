# ✅ Deployment Checklist

Use this checklist to ensure a smooth deployment process.

## Pre-Deployment

- [ ] Code is pushed to GitHub repository
- [ ] All local changes are committed
- [ ] `.env` files are NOT committed (they're in `.gitignore`)
- [ ] Database schema is ready (`backend/database/schema.sql`)
- [ ] Seed data is ready (if needed)

## Railway Deployment Steps

### Database Setup
- [ ] Created Railway account
- [ ] Created new Railway project
- [ ] Added MySQL database service
- [ ] Copied database connection details (host, user, password, database name)
- [ ] Executed `schema.sql` to create tables
- [ ] (Optional) Executed seed files to populate data

### Backend Setup
- [ ] Added backend service to Railway project
- [ ] Set root directory to `backend`
- [ ] Set build command: `npm install`
- [ ] Set start command: `npm start`
- [ ] Added environment variables:
  - [ ] `DB_HOST` (from MySQL service)
  - [ ] `DB_USER` (from MySQL service)
  - [ ] `DB_PASSWORD` (from MySQL service)
  - [ ] `DB_NAME` (from MySQL service)
  - [ ] `PORT=5000`
  - [ ] `NODE_ENV=production`
- [ ] Backend deployed successfully
- [ ] Backend URL noted: `https://your-backend.railway.app`
- [ ] Tested backend health endpoint: `https://your-backend.railway.app/api/health`

### Frontend Setup
- [ ] Added frontend service to Railway project
- [ ] Set root directory to `frontend`
- [ ] Set build command: `npm install && npm run build`
- [ ] Set start command: `npx serve -s build -l 3000`
- [ ] OR configured as static site with output directory: `build`
- [ ] Added environment variable:
  - [ ] `REACT_APP_API_URL=https://your-backend.railway.app/api`
- [ ] Frontend deployed successfully
- [ ] Frontend URL noted: `https://your-frontend.railway.app`

### Final Configuration
- [ ] Updated backend CORS to include frontend URL (or set `FRONTEND_URL` env var)
- [ ] Tested frontend can communicate with backend
- [ ] Tested product listing page
- [ ] Tested product detail page
- [ ] Tested add to cart functionality
- [ ] Tested checkout process
- [ ] Tested order placement

## Post-Deployment

- [ ] Application is accessible via frontend URL
- [ ] All API endpoints are working
- [ ] Database operations are working (CRUD)
- [ ] No console errors in browser
- [ ] No CORS errors
- [ ] Mobile responsiveness tested
- [ ] Performance is acceptable

## Troubleshooting

If something doesn't work:
- [ ] Check Railway logs for errors
- [ ] Verify all environment variables are set correctly
- [ ] Check database connection is working
- [ ] Verify CORS configuration
- [ ] Check frontend API URL is correct
- [ ] Ensure database schema is executed

---

## Quick Commands Reference

### Test Backend Locally
```bash
cd backend
npm install
npm start
```

### Test Frontend Locally
```bash
cd frontend
npm install
npm start
```

### Build Frontend for Production
```bash
cd frontend
npm install
npm run build
```

### Test Database Connection
```bash
mysql -h <host> -u <user> -p <database>
```

---

**Deployment Status:** ⬜ Not Started | 🟡 In Progress | ✅ Complete

