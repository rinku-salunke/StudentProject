# StudentProject

## Branch Name Selection Interface

This project includes a web interface for selecting Git branches with a proper "Select Here" placeholder.

### Features

- ✅ Branch name dropdown with "Select Here" as default placeholder text
- ✅ Clean, modern UI design
- ✅ Interactive branch selection
- ✅ Real-time display of selected branch
- ✅ Multiple common branch naming conventions included

### How to Use

1. Open `index.html` in your web browser
2. You will see a dropdown menu labeled "Branch Name"
3. The default option displays "Select Here" as a placeholder
4. Click the dropdown to view and select from available branches
5. Click "Confirm Selection" or simply select a branch to see your choice displayed

### Available Branches

The interface includes several common branch types:
- `master` / `main` - Main branch
- `develop` - Development branch
- `feature/*` - Feature branches
- `bugfix/*` - Bug fix branches
- `release/*` - Release branches
- `hotfix/*` - Hotfix branches
- `copilot/*` - Copilot-generated branches

### Solution

**Issue:** Branch name option was not showing "Select Here" as expected.

**Fix:** Created an HTML interface with a proper select dropdown element that includes:
- `<option value="" disabled selected>Select Here</option>` as the first option
- This ensures "Select Here" appears as the placeholder text
- The `disabled` attribute prevents it from being submitted
- The `selected` attribute makes it the default visible option

### Technical Details

- Pure HTML, CSS, and JavaScript (no dependencies)
- Responsive design that works on all devices
- Modern UI with gradient background and smooth transitions
- Form validation to ensure a branch is selected before submission