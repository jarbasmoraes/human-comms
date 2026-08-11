# Example: error report

Demonstrates: **bottom line first**, **plain language over codenames**, and
**facts survive verbatim** — the number (100 MB), the time (3pm), and the fix
duration (30 minutes) pass through untouched while the jargon around them
disappears.

## Before

> FileIngestGuard threw an UnhandledPromiseRejection in the S3 multipart flow
> after the ETag mismatch retry loop exhausted. This appears to be related to
> the changes deployed yesterday to the storage abstraction layer, which
> modified the checksum validation strategy for chunked uploads exceeding the
> configured threshold of 100 MB. Stack trace below (400 lines)...

## After

> File uploads over 100 MB are failing for users. Smaller uploads work.
>
> - Started after yesterday's storage change: the step that verifies uploads now rejects large files.
> - Fix is to roll back that change, about 30 minutes.
>
> **Blocked on:** nothing. I'll roll back at 3pm unless you object.
> Full error trace available on request.

## Why it works

The reader learns the user impact in the first sentence, the cause and fix in
two bullets, and exactly what happens if they do nothing. `FileIngestGuard`
became "the step that verifies uploads" — but 100 MB stayed 100 MB.
