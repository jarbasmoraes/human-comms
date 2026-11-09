# Example: large report (more facts than fit in 5 bullets)

Demonstrates: **budgets bound clutter, not information** — when the work
genuinely produced more than five facts the reader needs, group bullets
under short bold labels instead of dropping facts or writing one long flat
list. The 15-second skim still works: bottom line + group labels tell the
state.

## Before (facts lost to the budget)

> The database migration is mostly done. I migrated the user and billing
> tables, fixed two schema conflicts along the way, and found some issues
> with the reporting queries that we should discuss at some point. A few
> smaller things came up too but nothing urgent.

*Six real findings were compressed into "some issues" and "a few smaller
things". The reader cannot act on any of it.*

## After (grouped, nothing lost)

> Migration is 80% done and on track for Friday. Two decisions needed below.
>
> **Done:**
> - User and billing tables migrated and verified (2.1M rows, zero mismatches).
> - Fixed two schema conflicts: duplicate email index, and a column rename that broke the invoice export.
>
> **Still open:**
> - Reporting tables are next, about a day of work.
> - Nightly backup job still points at the old database. I'll switch it after the reporting tables move.
>
> **Decisions needed:**
> - Old database: keep it for 30 days as a fallback, or drop it at cutover? I recommend 30 days, storage cost is about $40.
> - Read-only mode during final cutover means roughly 10 minutes of downtime Friday. OK to schedule for 7am?
>
> Without approval, cutover remains pending. The old database stays in place.

## Why it works

Eleven facts survive, yet the message skims in seconds: the bottom line
gives the state, and the three labels (**Done / Still open / Decisions
needed**) let the reader jump straight to what needs them. Length came from
facts, not padding — every line carries something the reader needs.
