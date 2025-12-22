<!-- file: TODO.md -->
<!-- version: 1.0.1 -->
<!-- guid: 12345678-1234-1234-1234-123456789005 -->

# TODO - release-frontend-action

## CI/CD Failures - HIGH PRIORITY

### #todo Fix YAML Line Length Errors
**Status:** Open
**Priority:** High
**Issue:** yamllint failing due to lines exceeding 80 character limit

**Error Messages:**
```
action.yml:6:81: [error] line too long (82 > 80 characters) (line-length)
action.yml:122:81: [error] line too long (83 > 80 characters) (line-length)
action.yml:140:81: [error] line too long (89 > 80 characters) (line-length)
action.yml:141:81: [error] line too long (93 > 80 characters) (line-length)
action.yml:143:81: [error] line too long (82 > 80 characters) (line-length)
action.yml:144:81: [error] line too long (98 > 80 characters) (line-length)
```

**Fix Required:**
- Break long lines in action.yml to comply with 80 character limit
- Focus on lines: 6, 122, 140, 141, 143, 144
- Use YAML multiline syntax for long descriptions or commands

**Files to Fix:**
- `action.yml` - All identified long lines

**Log File:** `../ghcommon/logs/ci-failures/release-frontend-action_20251218_231439.log`

---

### #todo Create Missing README.md
**Status:** Open
**Priority:** High
**Issue:** README.md file is missing

**Error Message:**
```
Error: README.md not found
```

**Fix Required:**
- Create comprehensive README.md with:
  - Action description and purpose
  - Usage examples (React, Vue, Angular, etc.)
  - Input/output documentation
  - Build configuration examples
  - Deployment examples
  - Troubleshooting guide

**Files to Create:**
- `README.md` - Complete documentation

---

### #todo Fix Cache Dependencies Error
**Status:** Resolved
**Priority:** High
**Issue:** Cache setup failing because dependency file path not resolved

**Error Message:**
```
##[error]Some specified paths were not resolved, unable to cache dependencies
```

**Fix Applied:**
- Action now detects lock files and skips cache setup when none are present to
  avoid resolution failures.
- CI test project now generates a package-lock.json before invoking the action,
  so the cache path is valid.

**Files Updated:**
- `action.yml`
- `.github/workflows/ci.yml`

---

## Migration Tasks

### #todo Migrate to Reusable Workflows
**Status:** Pending
**Priority:** Medium
**Dependencies:** CI failures must be fixed first

**Description:**
After fixing CI issues, migrate this action's workflow to use the new centralized reusable workflows from ghcommon:
- `.github/workflows/reusable-action-ci.yml`
- `.github/workflows/reusable-release.yml`

**Tasks:**
1. Fix yamllint errors (see above)
2. Create README.md (see above)
3. Fix cache dependencies error (see above)
4. Update workflow to call reusable workflow
5. Test that workflows still work correctly
6. Pull logs and verify success
7. Document any issues encountered

---

## Testing Requirements

### #todo Comprehensive Testing
**Status:** Pending
**Priority:** High

**Required Tests:**
1. Test with React applications
2. Test with Vue applications
3. Test with Angular applications
4. Test with different build tools (Vite, Webpack, etc.)
5. Test with different Node versions
6. Test deployment scenarios

**Test Coverage:**
- [ ] React (Create React App)
- [ ] React (Vite)
- [ ] Vue 3 (Vite)
- [ ] Angular
- [ ] Next.js
- [ ] Nuxt.js
- [ ] Different Node versions (18, 20, 21)
- [ ] Different package managers (npm, yarn, pnpm)
- [ ] Production builds
- [ ] Static site generation
- [ ] Deployment artifact creation

---

## Documentation Updates

### #todo Create Complete Documentation
**Status:** Pending
**Priority:** High

**Required Documentation:**
1. README.md with usage examples for each framework
2. Examples directory with sample configurations
3. Troubleshooting guide for common issues
4. Best practices for frontend builds
5. Performance optimization tips
6. CI/CD integration examples

**Documentation Sections:**
- [ ] Quick start for each major framework
- [ ] Input parameter reference
- [ ] Output reference
- [ ] Framework-specific examples
- [ ] Build optimization guide
- [ ] Caching strategies
- [ ] Deployment scenarios
- [ ] Troubleshooting common build issues

---

## Enhancement Opportunities

### #todo Advanced Features
**Status:** Pending
**Priority:** Low

**Potential Enhancements:**
1. Automatic framework detection
2. Build performance metrics
3. Bundle size analysis
4. Lighthouse CI integration
5. Automatic optimization suggestions
6. Multi-environment build support

---

**Last Updated:** 2025-12-19
**Next Review:** After CI fixes complete
**Priority Focus:** Fix yamllint → Create README → Fix cache → Test migrations
