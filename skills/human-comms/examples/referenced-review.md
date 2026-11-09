# Referenced review

Use IDs because the reader needs to decide and track individual items, not
because a response passed an item-count threshold. This is an illustrative case.

## Initial review

Document ID: import-validation. Review date: 2026-10-16.

The staging import completed; production execution awaits the required approval.

- **F1 (verified):** staging processed 18,342 rows; the supplied reconciliation
  result shows no duplicate writes in that run.
- **R1:** production volume exceeds the staging sample. Production duration
  has not been measured.
- **D1 (proposed):** run production in the approved maintenance window, after
  confirming rollback readiness.
- **A1 (pending):** obtain the production approval. No execution is scheduled.

**Question:** approve D1 or request a larger staging run first?
Without approval, production remains pending.

## Later update

If the reader requests a larger staging run, keep the original identities:

- **D1 (deferred):** production approval remains pending further staging evidence.
- **A2 (pending):** run the larger staging validation, within authorized scope.

Do not rename A2 to A1 because the previous action is no longer first in a list.
In another document, refer to `import-validation/D1` to avoid collisions.
