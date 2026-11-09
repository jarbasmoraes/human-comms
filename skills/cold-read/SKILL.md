---
name: cold-read
version: 2.0.0
description: >-
  Write self-contained, timeless answers for a reader with zero context: a
  multitasking person switching in cold, or someone reading years later. A
  variant of human-comms. Use when the user says they are multitasking,
  context-switching, or lost; asks for an atemporal, standalone, or
  "explain like I know nothing" answer; or wants text that still makes sense
  in 10 years. Names every subject, states the impact and cause-and-effect
  chain of every item, uses absolute dates and stable identifiers, and
  removes references to the conversation.
---

# Cold-Read Communication Protocol

Write every answer so a reader with no memory of the work understands it in
one pass. Assume the reader is switching in from another task, or reading this
years from now with no access to the chat, the people, or the current state of
the tools. The text must stand alone.

This skill extends human-comms. If human-comms is available, apply all of its
rules. The core ones are repeated below so this skill also works alone.

## Core rules inherited from human-comms

1. Lead with the answer, outcome, or central claim. State whether the reader
   must act, and what to answer.
2. Use plain, specific words and active verbs. Cut filler, flattery, slogans,
   and repetition. Avoid em dashes and en dashes as prose punctuation.
3. Preserve exact commands, paths, URLs, names, dates, units, and numbers.
   Never invent precision.
4. Distinguish observed facts, reports, inferences, and unknowns. Separate
   recommendations from approved decisions and planned work from done work.
5. Use prose for connected reasoning, bullets for parallel items, numbered
   lists for sequences, tables for comparisons.
6. Write in the reader's language.

## Add the cold-read rules

### 1. Open with a context line, then the answer

Start with one or two sentences that orient a stranger: what the project or
system is, and what goal this answer serves. Then give the answer. Example:
"`human-comms` is an agent skill that tells AI assistants how to write
messages. Goal: add a variant for readers without context. Result: done."

Keep the context line short. Orientation, not history.

### 2. Name things instead of pointing at them

- Replace "the bug", "the PR", "that file", "this approach" with the full
  name: repository, file path, function, ticket ID, error message.
- Replace pronouns whose antecedent is in an earlier message.
- Never write "as discussed", "as above", "earlier", "like before", "my last
  change", or "option 2" unless the item is restated in this message.
- If you use a reference code (F1, D1, A1), restate what it refers to in the
  same message.

### 3. Make time absolute

- Replace "today", "yesterday", "now", "currently", "recently", "soon",
  "next week" with an ISO date (YYYY-MM-DD). Add the timezone when the hour
  matters. Check the system date instead of guessing. If the date is unknown,
  say so.
- Replace "new", "latest", "modern", "old", "legacy" with the version number
  or the date. "Latest" decays. "v2.3.1 (released 2026-09-12)" does not.
- Mark state as a snapshot: "As of 2026-10-22, the build passes." The reader
  must know when a fact was true.

### 4. Prefer identifiers that survive

- Cite a commit SHA, tag, or release instead of a branch name such as `main`.
- Cite a permalink or document ID instead of "the doc" or "the dashboard".
- Assume links will break. Put the essential content in the text and use the
  link as supporting evidence, not as the only carrier of meaning.
- Name tools and services fully on first use. Do not rely on internal
  nicknames, team slang, or trending terms that may lose meaning.

### 5. Explain terms on first use

Expand every acronym once. Define any term a capable outsider to this project
would not know, in a few words. Keep identifiers exact even when explaining
them.

### 6. State the impact and the cause-and-effect chain of every item

Every fact, change, finding, decision, risk, and open item must answer "so
what?". A reader without context cannot infer consequences.

- Write the chain explicitly: cause, then effect, then impact. Example:
  "The certificate expired (cause), so the sync stopped (effect), so 41,000
  invoices were missing from the database for 3 days (impact)."
- Use connectors that show causality: "because", "so", "which means",
  "as a result". Do not leave two facts side by side and expect the reader to
  connect them.
- Name who or what is affected and how much: users, systems, money, time,
  data, risk. Use numbers when available.
- For changes, state the effect after the change compared with before.
- For open items and pending decisions, state the impact of leaving them
  unresolved and the impact of each option.
- Mark the evidence: separate observed impact from expected or inferred
  impact. If the impact is unknown, say "impact unknown" and what would
  measure it. Never invent impact to complete the chain.
- If an item has no meaningful impact, cut it or say why it is still recorded.

### 7. Say why, not only what

A future reader cannot ask questions. State the reason behind a decision or
recommendation, the main alternative rejected, and the condition that would
change it. One sentence each is usually enough.

### 8. End with state and next step

Close with the current state and what remains, so a reader who skims only the
end still knows where things stand. Include who must act, if known. Never
invent an owner or deadline.

## Keep it short

Self-contained does not mean long. Add only the context a stranger needs to
understand and verify the answer. Do not narrate the work chronologically,
dump logs, or explain what any competent reader already knows. A quick answer
can still fit in a few sentences.

Read [Cold-read answer](examples/cold-read-answer.md) for a before and after.

## Review before sending

- Could someone who never saw this conversation understand it?
- Will it still be correct and interpretable in 10 years? Are all dates
  absolute and all "latest", "now", and "new" replaced?
- Is every "this", "that", "it", and "the X" resolvable inside this message?
- Does every item state its impact and the cause-and-effect chain, with
  observed impact separated from inferred or unknown impact?
- Are acronyms expanded and identifiers stable (SHA, version, full path)?
- Does the opening give context, answer, and required action in 15 seconds?
- Can anything be cut without losing that standalone meaning?

Perform this review silently. Do not append the checklist to the response.
