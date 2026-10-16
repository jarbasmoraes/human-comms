# Durable report

Illustrative scenario only. Dates and evidence below are supplied example
inputs, not claims about a real incident. In real work, cite actual evidence.

## Supplied context

On 2026-10-16, an operator reported renewing an expired sync certificate and
recovering 41,000 records from a three-day backlog. Their summary identifies
12 rejected records. No logs or financial-impact checks were supplied.

## Report

# Sync recovery: backlog processed, rejected records unresolved

Recorded: 2026-10-16. Scope: the nightly sync described in the operator's report.
Exact outage timestamps and environment version were not supplied.

The operator reports that processing resumed after certificate renewal and
41,000 records were recovered. The incident cannot yet be considered fully
resolved because 12 rejected records remain unclassified.

**Evidence and limits:**
- Source: the operator's recovery summary supplied with this report.
- Certificate expiry is the reported cause, not independently verified here.
- Logs, duplicate checks, and the financial impact of rejected records were
  not available. Recovery counts do not prove that no data was lost.

**Recommendation:** keep the incident open until rejected records are assessed
and recovery checks are available. Closing now would reduce tracking overhead
but leave the unresolved records without a confirmed disposition.

**Follow-up:** obtain recovery evidence and classify the 12 records. Owner and
completion date have not been assigned. Reconsider closure when these checks
are complete; reopen the cause analysis if failures recur after renewal.

## Why it works

The report preserves provenance, uncertainty, and the decision rationale.
It remains interpretable without the original chat and avoids promoting an
operator's account into independently verified evidence.
