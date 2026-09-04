# Prem Easwaran — Portfolio (Flutter Web + GetX)

A Flutter/GetX rewrite of the portfolio, with:
- Circular, **full-colour** profile photo (no B/W filter)
- Bigger, bolder headings (Sora, weight 800) + Manrope body copy
- Scroll-reveal + hover animations driven by a GetX controller
- A résumé download button that actually works

## 1. One-time setup

This zip contains only the `lib/`, `pubspec.yaml`, and a couple of `web/`
files — you need to let Flutter generate the platform scaffolding first.

```bash
# unzip, then inside the project folder:
flutter create .
```

This adds `android/`, `ios/`, the rest of `web/`, etc. **It will not
overwrite** the `lib/`, `pubspec.yaml`, or `web/index.html` /
`web/manifest.json` already in this project — those are yours.

Then install dependencies:

```bash
flutter pub get
```

## 2. Add your real assets

Two placeholder `.txt` files tell you exactly what to swap in:

- `assets/PUT_PROFILE_PHOTO_HERE.txt` → add `assets/profile.png` (your colour photo)
- `web/PUT_RESUME_HERE.txt` → add `web/resume.pdf` (your résumé)

Delete the `.txt` placeholders once you've added the real files.

## 3. Run it

```bash
flutter run -d chrome
```

## 4. Build for deployment

```bash
flutter build web
```

Output lands in `build/web/` — upload that folder's contents to any static
host (Netlify, Vercel, GitHub Pages, Firebase Hosting, etc.).

## Notes

- State/animation is centralized in `lib/controllers/portfolio_controller.dart`
  (a `GetxController`) — every fade/slide-in and hover effect reads from its
  reactive (`.obs`) flags via `Obx`.
- Colours, fonts, and breakpoints live in `lib/theme/app_theme.dart` if you
  want to tweak the palette or type scale.
- Contact links use `url_launcher`, which works out of the box on web.
