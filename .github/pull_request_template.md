## What does this change?

<!-- One or two sentences. Link the issue if there is one: Closes #123 -->

## Checklist

- [ ] `stylua --check nvim/ scripts/` passes
- [ ] `nvim --headless -l scripts/check-keymaps.lua` passes
- [ ] `scripts/smoke-test.sh` passes
- [ ] New or changed shortcuts are in `docs/keymaps.md`
- [ ] `nvim/nvim-pack-lock.json` is committed if plugins changed
- [ ] `CHANGELOG.md` has an entry under "Unreleased"
