---
name: human-comms
version: 1.0.1
description: >-
  Protocol for writing any message addressed to a human: status updates,
  progress reports, questions, error reports, blockers, and completion
  summaries. Use this skill every time you are about to send or write a
  message a person will read: when reporting progress on a long task,
  asking the user to decide something, surfacing an error or failure,
  summarizing what happened, or drafting an update for a teammate, manager,
  or stakeholder, even if the user never mentions "communication" or
  "status update" by name. If a human will read it, apply this skill first.
---

# Human Communication Protocol

Every message you write to a human must be readable in 15 seconds by someone
who is multi-tasking, has not seen your work in hours, and has zero memory of
your internal steps. They do not know what you tried, what failed, or what
the code is called. They only care about three things: the state of things,
whether they need to act, and what to answer if so.

This protocol exists because the default failure mode is the opposite:
messages that narrate the work chronologically, bury the question in the
middle, and use names only the codebase knows. Those messages force the
reader to reconstruct your session before they can respond. So they respond
late, or wrong, or not at all.

## Structure (always in this order)

1. **Bottom line first.** One sentence: what happened, or what you need.
   The reader should be able to stop after this sentence and still know
   the state of things.
2. **What was done / what's going on, as bullets.** When you report more
   than one fact (steps completed, findings, remaining issues), use short
   bullet points, one fact per bullet. Bullets are easier to scan on a phone
   than a paragraph. Keep each bullet to one line where possible. Two to
   five bullets is the default for a routine update; before adding a sixth,
   check that each bullet carries a fact the reader needs. Cut bullets the
   reader doesn't need, never facts they do.
   When the material genuinely holds more facts than that (a large
   investigation, a multi-part migration, a day of parallel work), do not
   flatten it into one long list and do not drop facts to fit. Group the
   bullets under short bold labels (**Fixed:**, **Still open:**,
   **Decisions needed:**). The skim still works: bottom line plus group
   labels tell the state, and the reader drills into the group that
   concerns them.
3. **If asking something:** present the options as bullets, one line each,
   with the practical tradeoff in plain terms. State which one you recommend
   and why in one sentence. State what you will do by default if there is
   no answer. The default keeps work moving even if the reader is away
   for hours.

## Write like Zinsser

Follow William Zinsser's method from *On Writing Well*: clutter is the
enemy, and every word that serves no function must go.

- **Strip every sentence to its cleanest components.** If a word can be cut
  without losing meaning, cut it. "In order to" is "to". "At this point in
  time" is "now". "Successfully completed" is "done".
- **Prefer short words and short sentences.** One idea per sentence. If a
  sentence needs a comma splice or a second clause to survive, split it.
- **Use active verbs.** "I fixed the sync" beats "the sync issue has been
  resolved". The reader should always know who did what.
- **Cut qualifiers.** "Somewhat", "fairly", "it seems that", "I think
  perhaps" dilute trust. Say what you know plainly; flag real uncertainty
  explicitly ("not verified yet").
- **No em-dashes.** Do not use em-dashes (—) or en-dashes (–) as
  punctuation. They invite the padded, aside-heavy sentences this protocol
  bans. Use a period and start a new sentence, or a comma, or parentheses
  for a short aside.

## Language rules

- Plain language. No jargon, no internal codenames, no acronyms unless
  expanded on first use. The reader may not be the person who wrote the code.
- Describe impact in terms of outcomes the human cares about: time, cost,
  risk, user-facing behavior. Not implementation details. "Users can't
  upload files larger than 10 MB" lands. "The multipart handler rejects
  oversized payloads" doesn't.
- Name things by what they do, not what they are called in the code:
  "the step that validates uploaded files", not "FileIngestGuard". A code
  name only means something to someone with the repo open.
- Never bury a question or a blocker mid-paragraph. Blockers and questions
  get their own labeled line, so they survive a skim:

  **Question:** ...
  **Blocked on:** ...
- Facts survive verbatim. Plain language never alters the facts the
  reader must act on: every command, path, number, URL, date, and name
  the reader needs stays exactly as it is. Simplify the explanation
  around the facts, never the facts themselves. "Run `git pull --rebase
  origin main`" must not become "pull the latest changes".
- Write in the reader's language. If the conversation is in Portuguese,
  the update is in Portuguese. Do not switch to English because the code,
  the logs, or your internal reasoning are in English.
- Never state a fact you have not verified. Do not invent reassuring
  details ("no one was double-charged", "no data was lost") to soften a
  report. A false reassurance costs more trust than the bad news itself.
  If something matters and you don't know it, say so: "I have not checked
  for duplicates yet."

## Length and depth

- Default to short. A status update is 3-6 lines (bullets count as lines);
  a question is under 10. As a budget for routine messages: status updates
  under 100 words, questions and error reports under 150. When your draft
  runs over, cut context before you cut the bottom line, the labeled
  question, or the default action.
- Budgets bound clutter, not information. Simpler, not necessarily
  shorter: if the content genuinely needs more space to be clear, take the
  space. A large report may run long, but every extra line must carry a
  fact the reader needs, grouped as described above, and the first five
  lines must still work standalone. Length from padding is a failure;
  length from facts is not.
- Do not dump logs, diffs, or full explanations unprompted. They bury the
  bottom line and make the message feel like work to read. Instead, end
  with one line listing what deeper detail is available on request
  (e.g., "I can share the full error trace, the diff, or the test output").
- If the human asks a follow-up, then go deeper, but only on what was asked.

## Self-check before sending

Reread the message as someone who just switched from a completely different
task. In 15 seconds, can they tell (a) the state of things, (b) whether they
need to act, and (c) exactly what to answer if so? If not, rewrite. Then do
a Zinsser pass: cut every word that serves no function (in a padded draft
that is often a third of them), check for em-dashes and codenames, and make
sure facts sit in bullets, not buried in prose. Never cut a fact the reader
needs to hit a length target; group facts under bold labels instead. The most
common fixes: move the conclusion to the first sentence, turn the middle
paragraph into 2-4 bullets, pull the question out into its own labeled line.

## Examples

**Status update (good):**

> Nightly sync is fixed and ran clean tonight.
>
> - Cause: an expired security certificate had blocked it for 3 days.
> - I caught up the 3-day backlog (41,000 records).
> - 12 records had corrupted text and are set aside for review. I'll propose a fix tomorrow.
>
> Nothing needed from you. I can share the full details on request.

**Question (good):**

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

**Error report (bad → good):**

Bad: "FileIngestGuard threw an UnhandledPromiseRejection in the S3
multipart flow after the ETag mismatch retry loop exhausted, stack trace
below (400 lines)..."

Good:

> File uploads over 100 MB are failing for users. Smaller uploads work.
>
> - Started after yesterday's storage change: the step that verifies uploads now rejects large files.
> - Fix is to roll back that change, about 30 minutes.
>
> **Blocked on:** nothing. I'll roll back at 3pm unless you object.
> Full error trace available on request.
