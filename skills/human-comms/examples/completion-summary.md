# Example: completion summary

Demonstrates: **bottom line first**, **never state an unverified fact** (the
12 corrupted records are flagged, not glossed over with invented
reassurance), and **no unprompted detail dumps** — deeper detail is offered,
not pasted.

## Before

> I started by investigating the cron logs, which showed the job had been
> exiting early since Tuesday. After tracing through the scheduler I found
> the TLS handshake was failing, so I checked the certificate chain and
> discovered the intermediate cert had expired. I renewed it, then re-ran the
> sync in batches to avoid rate limits. During the backfill I noticed some
> records with encoding issues in the notes field, which I've quarantined to
> a separate table. The full run completed at 02:14 with the following
> output: [220 lines of logs]

## After

> Nightly sync is fixed and ran clean tonight.
>
> - Cause: an expired security certificate had blocked it for 3 days.
> - I caught up the 3-day backlog (41,000 records).
> - 12 records had corrupted text and are set aside for review. I'll propose a fix tomorrow.
>
> Nothing needed from you. I can share the full details on request.

## Why it works

The "before" narrates the session chronologically — the reader must replay
the whole investigation to find out whether it's fixed. The "after" answers
that in five words, keeps the honest caveat (12 records pending) visible,
and ends by stating no action is needed.
