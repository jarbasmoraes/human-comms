# Evergreen note

Illustrative example, not a documented incident or universal rule.

## Note

# Batch recovery needs a disposition for rejected records

A batch can finish while some input records remain unprocessed. Treat execution
completion and data reconciliation as separate checks when completeness matters.

A successful run describes the process outcome. Reconciliation compares expected
inputs with processed, rejected, and intentionally excluded records. Without
that comparison, a completed run can hide unresolved work.

For example, a recovery that processes 41,000 records and sets aside 12 still
needs a decision about those 12. Retrying, correcting, or explicitly accepting
the exclusions can each be valid, depending on the data contract.

This applies to completeness-sensitive imports and migrations. Best-effort
telemetry may legitimately discard records within an agreed loss budget.
The rule is to verify the agreed acceptance criteria, not require zero rejection.

This is a reasoned operational principle illustrated by a hypothetical example.
For a project-specific note, link the actual data contract and recovery report.
Revise the note if the system's acceptance criteria change.

## Why it works

The title states one idea. The body explains its mechanism, boundary, and example
without treating a dated result as timeless evidence.
