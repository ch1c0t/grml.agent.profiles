# GRML Mitamae profile tests

These opt-in profiles exercise Mitamae recipe application from
[grml.agent PR #10](https://github.com/ch1c0t/grml.agent/pull/10).

The repository is intended to be checked out or copied as the host-side
`shared/profiles/` directory. The tests run inside a disposable GRML guest.

## Successful smoke test

After booting GRML with the updated `grml.agent` and making these profiles
available under `/mnt/shared/profiles`, run:

```text
apply_profile mitamae-smoke
```

The profile depends on `rescue`, which installs Mitamae using the existing
`rescue/host-executables.txt` host-binary/fallback mechanism. It then applies
recipes from its own directory.

Expected markers under
`/var/lib/grml.agent.profiles/mitamae-smoke/`:

- `direct-recipe` — direct `.rb` recipe.
- `list-entry` — recipe referenced by a `.list` file.
- `node-attributes` — profile-local `mitamae-node.yml` was read.
- `directory-recipe` — directory entry resolved to `default.rb`.

The nested list structure also exercises recursive list expansion. The
agent's streamed progress messages should report recipe execution in the
manifest/list order. Reapplying the profile should converge without changing
the marker contents.

## Expected-failure test

In the same disposable guest, run:

```text
apply_profile mitamae-failure-test
```

This command is expected to fail at `recipes/20-fail.rb`. The
`before-failure` marker should exist, while `after-failure` must not.
This verifies that a failing Mitamae invocation is propagated and later
recipes are not executed.

The failure profile is intentionally not part of the successful smoke test.
Do not use it as a normal boot profile.
