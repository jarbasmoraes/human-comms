# human-comms

[![skills.sh](https://skills.sh/b/jarbasmoraes/human-comms)](https://skills.sh/jarbasmoraes/human-comms)

An agent skill that makes AI-written messages readable in 15 seconds.

Coding agents write good code and bad updates. Left alone, they narrate the
session chronologically, bury the question in the middle of a paragraph, and
refer to things by class name. The human reading it has to reconstruct the
whole session before they can answer. So they answer late, or wrong, or not
at all.

This skill replaces that default with a protocol: bottom line first, facts as
bullets, questions on their own labeled line, and a stated default action if
nobody replies.

## What it changes

**Before:**

> FileIngestGuard threw an UnhandledPromiseRejection in the S3 multipart flow
> after the ETag mismatch retry loop exhausted, stack trace below (400 lines)...

**After:**

> File uploads over 100 MB are failing for users. Smaller uploads work.
>
> - Started after yesterday's storage change: the step that verifies uploads now rejects large files.
> - Fix is to roll back that change, about 30 minutes.
>
> **Blocked on:** nothing. I'll roll back at 3pm unless you object.
> Full error trace available on request.

## Install

With the [skills](https://github.com/vercel-labs/skills) CLI, which detects your
agent and puts the files in the right place:

```bash
npx skills add jarbasmoraes/human-comms
```

Add `-g` to install globally instead of into the current project.

### Manual

Or clone into your agent's skills directory.

**Claude Code (all projects):**

```bash
git clone https://github.com/jarbasmoraes/human-comms.git ~/.claude/skills/human-comms
```

**Claude Code (one project):**

```bash
git clone https://github.com/jarbasmoraes/human-comms.git .claude/skills/human-comms
```

**Pi:**

```bash
git clone https://github.com/jarbasmoraes/human-comms.git ~/.pi/agent/skills/human-comms
```

The directory name must be `human-comms` to match the `name` field in
`SKILL.md`. Restart your agent session to pick it up.

## Use

The skill triggers on its own. Its description tells the agent to load it
before writing anything a person will read: progress reports, questions,
error reports, blockers, completion summaries. You do not need to mention
"communication" or "status update" by name.

To force it, ask directly:

```
Use the human-comms skill to write the update.
```

```
Rewrite this message following human-comms.
```

It also works well as a review pass on a draft you wrote yourself.

## The rules, in short

- **Bottom line first.** One sentence. The reader can stop there and still
  know where things stand.
- **Facts as bullets.** Two to five, one fact each. More than that means
  you're including things the reader doesn't need.
- **Questions get a labeled line.** `**Question:**` and `**Blocked on:**`
  survive a skim. Mid-paragraph questions don't.
- **Always state a default.** What you'll do if nobody answers. Work keeps
  moving while the reader is away.
- **Plain language.** No codenames, no jargon. Say "the step that validates
  uploads", not `FileIngestGuard`.
- **Write like Zinsser.** Cut every word that serves no function. Active
  verbs, short sentences, no qualifiers, no em-dashes.
- **Never state an unverified fact.** No invented reassurance to soften bad
  news. If you don't know, say you don't know.
- **Budgets.** Status updates under 100 words, questions and error reports
  under 150. No unprompted log dumps.

Full protocol, with rationale and examples: [`SKILL.md`](./SKILL.md).

## Compatibility

Standard skill format: YAML frontmatter with `name` and `description`, plus
Markdown instructions. Works with Claude Code, Pi, and any agent that reads
`SKILL.md` files. No dependencies, no install step, nothing to build.

## License

MIT. See [`LICENSE`](./LICENSE).
