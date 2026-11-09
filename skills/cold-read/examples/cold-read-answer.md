# Example: cold-read answer

Illustrative scenario only. Names, dates, and numbers are example inputs.

## Before

> Fixed it. The cert thing was the issue like we thought, so I went with
> option 2 and bumped it to the latest version. The backlog is caught up now
> and those 12 records from earlier are still pending. Should I merge to main?

## After

> **Context:** `billing-sync` is the nightly job that copies invoices from the
> Stripe payment API into the company Postgres database. It stopped on
> 2026-10-13.
>
> **Result:** as of 2026-10-16, the job runs again and the 3-day backlog
> (41,000 invoices) is copied. Impact: the database is complete again, except
> for 12 invoices described below.
>
> - Cause and effect: the TLS (encrypted connection) certificate for the
>   Stripe endpoint expired on 2026-10-13, so Stripe refused every connection,
>   so no invoices reached the database from 2026-10-13 to 2026-10-16. Any
>   report built on that database during those days undercounted invoices.
>   Which reports were read in that window is unknown.
> - Fix: upgraded the `stripe-node` library from v12.4.0 to v14.1.0 in commit
>   `a1b2c3d`. The library now reads certificates from the operating system
>   instead of a bundled file, so future certificate renewals no longer need
>   a code change. Rejected alternative: renewing the bundled file manually,
>   because it would expire again in 12 months and cause the same outage.
> - Unresolved: 12 invoices with corrupted text in the `notes` field are held
>   in the table `billing_sync_quarantine`. Impact: those 12 invoices are
>   missing from the database, so totals for their customers are incomplete.
>   The money involved is unknown until someone reviews them. No owner assigned.
>
> **Question:** may I merge branch `fix/stripe-cert` (head `a1b2c3d`) into
> `main`? Impact of waiting: production keeps running the fix from a branch
> deploy, and the next deploy from `main` would remove it and stop the sync again.

## Why it works

The "before" depends on the chat: "it", "the cert thing", "option 2",
"latest", "now", and "from earlier" mean nothing to a reader switching in or
reading years later. The "after" names the system and its purpose, uses
absolute dates, pins versions and a commit, and expands TLS. Every item states
its cause-and-effect chain and impact, including the impact of the open item and
of not approving the merge. Unknown impact is marked as unknown instead of
guessed.
