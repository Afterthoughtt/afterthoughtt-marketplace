---
name: wrap
description: End-of-session closeout — commit, push, and print a paste-ready handoff.
disable-model-invocation: true
---

# Wrap: session closeout

Close the session: get the work into git, then hand the user a block they can paste into their next session. Run the steps in order.

## 1. Project closeout first

If the project's CLAUDE.md defines its own closeout process, run that process now, then continue below, skipping anything it already covered.

## 2. Commit and push

Stage all changes, commit with a message describing the session's work, and push if a remote exists.

## 3. Handoff

End the turn with a single fenced code block, written to be pasted as the first message of the next session and read by that session's Claude cold. Contents, in order:

- **Goal:** the project's current objective, one line.
- **This session:** what was done, a few lines.
- **Verified:** claims backed by a tool result from this session (tests run, output seen).
- **Unverified:** work not confirmed working, plus anything assumed.
- **Next:** the single most likely next step, concrete enough to start on immediately.
- **Watch out:** gotchas or open questions the next session needs, if any.

Audit every line against what actually happened this session; a claim with no tool result behind it goes under Unverified. Keep the block under 20 lines. Above the block, state in one line what was committed and pushed — or that no remote exists.

Done when the working tree is clean, the push result is stated, and the handoff block is the last thing in the turn.
