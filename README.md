# Tracker

Habits, protein and weekly training. Installable web app (PWA) with Supabase sync.

## Files

| File | What it is |
|---|---|
| `index.html` | The whole app |
| `config.js` | Your Supabase URL + key (edit this) |
| `supabase.js` | Supabase client library (bundled so the app works offline) |
| `sw.js` | Service worker: caches the app so it opens offline |
| `manifest.webmanifest`, `*.png` | App name and icons for the home screen |
| `setup.sql` | Database table + security rules (run once in Supabase) |

## Setup

1. **Supabase project** – supabase.com → New project (free tier). Wait for it to finish provisioning.
2. **Database** – SQL Editor → New query → paste `setup.sql` → Run.
3. **Keys** – Project Settings → API Keys. Copy the Project URL and the publishable key (`sb_publishable_…`, or the legacy `anon` key) into `config.js`. Never use the secret / service_role key.
4. **GitHub** – upload every file in this folder to your `tracker` repo (Add file → Upload files → drag all files → Commit).
5. **GitHub Pages** – repo Settings → Pages → Source: Deploy from a branch → `main` / `(root)` → Save. After ~1 minute the app is live at `https://<username>.github.io/tracker/`.
6. **Supabase URL settings** – Authentication → URL Configuration → Site URL: your GitHub Pages URL (so confirmation emails link back to the app).
7. **Create your account** – open the app, tap *First time? Create account*. If email confirmation is on, click the link in the email, then sign in.
8. **Lock it down** – Authentication → Sign In / Providers → turn off *Allow new users to sign up*. Only your account can use the app's database.

## Install on iPhone

Open the URL in **Safari** → Share → **Add to Home Screen**. Open it from the icon, sign in once.

Android (Chrome): menu → Install app.

## Updating the app

Edit files, then in `sw.js` change `VERSION` (e.g. `tracker-v2`) and upload. Phones get the new version on the next launch after that (open it twice).

## Notes

- Works offline: changes are saved on the device and sync when you're back online.
- Sync runs on open, on focus, and every 30 s while open.
- Free Supabase projects pause after 7 days with no activity. Daily use keeps it awake; if it pauses, restore it from the Supabase dashboard (data is kept).
- Export backup / Import in the footer save or restore everything as a JSON file.
