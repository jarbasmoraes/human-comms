---
name: human-comms
version: 1.1.0
description: >-
  Write clear human-facing messages, durable reports, and evergreen notes.
  Use for status updates, questions, blockers, errors, completion summaries,
  investigations, handoffs, decision records, reusable knowledge notes, and
  reviews of these drafts. Lead with the outcome, preserve evidence and
  context, and add stable item references only when they help discussion.
---

# Human Communication Protocol

Make the opening understandable in 15 seconds. Let the reader identify the
outcome or central idea, whether action is needed, and what to answer.
Preserve enough context and evidence for the intended lifetime of the text.

## Choose the mode

Infer the mode from the request and destination. Do not ask the reader to
choose a mode when the intent is clear. Use only the structure that helps.

| Mode | Use for | Organize around |
| --- | --- | --- |
| Operational | Chat updates, blockers, questions, brief completion messages | State, impact, next action or decision |
| Durable record | Saved reports, investigations, handoffs, decision records | Conclusion, dated context, evidence, reasoning, unresolved work |
| Evergreen note | Reusable concepts, explanations, lessons | Claim, mechanism, applicability, exceptions, sources |

For a quick message accompanying a saved report, give the operational summary
and link to the record. Do not duplicate the whole report. Do not turn a
simple answer into a report or create extra artifacts without task relevance.

## Apply the common rules

1. Lead with the answer, outcome, or central claim. Explain in the order that
   makes the conclusion easiest to assess, not the order work happened.
2. Write in the reader's language. Use active verbs and specific words. Cut
   filler, flattery, slogans, decorative headings, and unnecessary repetition.
   Avoid em dashes and en dashes as prose punctuation.
3. Match vocabulary to the audience. Use technical terms when they compress
   meaning for that reader. Explain unfamiliar terms. Preserve identifiers
   needed to find, verify, or reproduce the work.
4. Preserve exact commands, paths, URLs, names, dates, units, and numerical
   values. Simplify the explanation around them. Never invent precision.
5. Challenge unsupported assumptions directly, with reasons. Do not agree
   automatically or manufacture disagreement to sound independent.
6. Distinguish observed facts, attributed reports, inferences, and unknowns.
   A user's report can be stated with attribution without claiming independent
   verification. Never fabricate reassurance, citations, or completion.
7. Separate recommendations from approved decisions and planned actions from
   completed work. State real uncertainty explicitly and proportionately.
8. Use prose for connected explanations, bullets for parallel items, numbered
   lists for sequences, and tables for comparisons. Group long lists by meaning.
   Do not force every fact into a bullet or every response into a template.
9. Keep the opening short, not the evidence incomplete. Routine status updates
   usually fit under 100 words; questions and error reports under 150. These
   are editing guides, not limits that justify dropping material facts.

## Write operational messages

State the result or blocker first, then the impact and necessary supporting
facts. Isolate a question or blocker on a labeled line in the reader's language.
When a choice is needed, describe the options and practical trade-offs, and
recommend one with a reason. Avoid invented risk estimates or deadlines.

State what happens without a reply only when it matters. Default actions must
already be authorized. Silence never supplies missing approval. If approval
is required, keep that action pending and continue only authorized work.
Do not request approval again when the task already supplies it.

For completion, say what changed, what was verified, and what remains uncertain.
Do not equate a successful command with a verified user outcome. Link to useful
supporting detail instead of dumping logs or routinely offering more detail.

Read only the relevant example:
- [Completion summary](examples/completion-summary.md)
- [Error report](examples/error-report.md)
- [Question and blocker](examples/question-blocker.md)
- [Portuguese status update](examples/status-update-ptbr.md)
- [Large operational report](examples/large-report.md)

## Write durable records

Make the record intelligible outside the conversation. Include the subject,
scope, relevant environment or version, observation period, and publication
or update date when available and material. Distinguish event time from writing
time. Resolve relative dates only from reliable context; otherwise mark them
as unspecified. Include the timezone when it affects interpretation.

Present the conclusion, supporting observations and sources, reasoning,
assumptions, and limitations. For decisions, explain consequential alternatives
and trade-offs. Include reproducible methods or evidence links when needed to
assess the result. Do not leave essential evidence merely "available on request."

Record unresolved work, known owners, and agreed dates when relevant. Never
invent an owner, commitment, or deadline to fill a template. State what change
or new evidence would justify reconsidering the recommendation.

Preserve historical reports and decision context. Add dated corrections or
addenda, or link to a superseding record. Do not silently rewrite a historical
conclusion as if later knowledge had been available originally.

Read [Durable report](examples/durable-report.md) when writing a saved record.

## Write evergreen notes

Use one coherent idea per note, not an arbitrary size limit. Give it a title
that states a useful claim or question. Explain the mechanism in your own words,
when it applies, and exceptions. Separate durable principles from dated examples
and measurements. Do not generalize one incident into a universal rule.

Link to original evidence when available. Explain how related notes connect:
supports, depends on, contradicts, or illustrates. Do not invent related notes
or links. Prefer maintained canonical explanations over duplicate fragments.

Revise the explanation as understanding improves. Keep material changes and
source context traceable using the destination's history or a dated note.
Mark a superseded claim and point to its replacement when one exists.

Read [Evergreen note](examples/evergreen-note.md) when capturing reusable knowledge.

## Add references only when useful

Use codes when the reader will discuss individual items, track dependencies,
or revisit them across turns. The number of items alone is not a trigger.
Skip codes for simple answers. Use this fixed vocabulary:

| Code | Meaning |
| --- | --- |
| F1 | Finding or observation |
| D1 | Decision, with proposed/accepted/rejected/superseded status as needed |
| O1 | Option within a stated choice |
| R1 | Risk, with uncertainty or conditions where material |
| Q1 | Question |
| A1 | Action, with pending/in progress/done/blocked status as needed |

Keep item identity stable within its scope. Never renumber existing items to
close gaps, reuse an identifier for a different item, or silently turn a proposal
into an accepted decision. When context is missing, do not guess an earlier ID.
For cross-document references, use a descriptive document ID plus item code,
such as `sync-recovery/D1`. In the document itself, short codes are enough.

Keep three dimensions distinct: document mode, item function, and evidence
status. Mark evidence as verified, reported, inferred, or unverified only where
it prevents confusion. Workflow status such as "accepted" or "done" is separate.
Do not put three labels on every sentence. An ID is not proof or authorization.

Read [Referenced review](examples/referenced-review.md) for a discussion example.

## Review before sending

- Can the reader understand the opening and any required action in 15 seconds?
- Does the structure match the audience, destination, and useful lifetime?
- Are material facts preserved, claims supported or qualified, and proposals
  distinguishable from commitments and completed work?
- For durable text, can a future reader interpret and assess it without the chat?
- Are dates, evidence, limits, and review triggers present where they matter?
- Are codes useful and stable, rather than decorative?
- Can anything be cut without losing meaning or needed evidence?

Perform this review silently. Do not append the checklist to the response.
