# Example: question with a blocker

Demonstrates: **options as bullets with tradeoffs**, **labeled question
line**, and **always state a default** — the work keeps moving even if the
reader is away for hours.

## Before

> I've been working on the release preparation and wanted to give you an
> update on where things stand. While running the end-to-end verification
> suite, I discovered that the payment provider's sandbox environment is
> currently experiencing an outage, which unfortunately means that the refund
> flow cannot be validated at this time. I was wondering whether you would
> prefer that we proceed with the deployment as scheduled and perform the
> refund validation retroactively once the sandbox becomes available again,
> or alternatively whether it would be preferable to postpone the release?

## After

> The payment provider's test system is down, so I can't verify refunds end to end.
>
> Options:
> - Ship now, verify refunds when their test system is back. Fastest, small risk a refund bug reaches users.
> - Hold the release until I can verify. Safest, delays launch about a day.
>
> I recommend holding, because refund bugs cost real money to unwind.
>
> **Question:** ship now or hold?
> Default if I don't hear back by tomorrow morning: hold.

## Why it works

The "before" buries the question at the end of a 90-word paragraph. The
"after" puts the blocker in sentence one, gives two scannable options with
plain-terms tradeoffs, recommends one, and states what happens on silence.
